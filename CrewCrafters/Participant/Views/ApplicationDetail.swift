import Foundation
import SwiftUI

struct ApplicationDetail: View {
    @EnvironmentObject var applyViewModel: ApplyViewModel
    let applicationIndex: Int
    let tech_stack: String
    let hackathonId: String
    let teamId: String
    @State private var navigateToSearch = false // State variable to control navigation

    var body: some View {
        let application = applyViewModel.applications[applicationIndex]
        
        VStack {
            Form {
                Section(header: Text("Personal Info")) {
                    Text("Name: \(application.name)")
                    Text("Email: \(application.email)")
                    Text("Phone No.: \(application.phone)")
                }
                
                Section(header: Text("Application Details")) {
                    Text("GitHub Link: \(application.githubLink)")
                    Text("How are you suitable for this role: \(application.suitability)")
                    Text("Previous Achievements: \(application.achievements)")
                }
            }
            .contentMargins(.horizontal, 5)
            
            HStack {
                NavigationLink(destination: Search(), isActive: $navigateToSearch) {
                    EmptyView() // Invisible NavigationLink
                }
                
                Button(action: {
                    // Handle approve action
                    updateStatus(status: 1)
                    navigateToSearch = true // Navigate to search page
                }) {
                    Text("Approve")
                }
                .buttonStyle(PlainButtonStyle())
                .padding()
                
                Button(action: {
                    // Handle reject action
                    updateStatus(status: -1)
                    navigateToSearch = true // Navigate to search page
                }) {
                    Text("Reject")
                }
                .buttonStyle(PlainButtonStyle())
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Application Detail")
        .padding(.all, 7)
    }
    
    private func updateStatus(status: Int) {
        let application = applyViewModel.applications[applicationIndex]
        let userId = application.userId // Assuming application ID represents the user's ID
        
        applyViewModel.applications[applicationIndex].status = status
        
        // Update the status in Firestore
        applyViewModel.db.collection("hackathons/\(hackathonId)/teams/\(teamId)/members")
            .document("members")
            .updateData([tech_stack: userId]) { error in
                if let error = error {
                    print("Error updating user's status: \(error)")
                } else {
                    print("User's status updated successfully!")
                }
            }
        
        applyViewModel.db.collection("hackathons/\(hackathonId)/teams/\(teamId)/\(tech_stack)")
            .document(application.id)
            .updateData(["status": status]) { error in
                if let error = error {
                    print("Error updating application status: \(error)")
                } else {
                    print("Application status updated successfully!")
                }
            }
    }

}
