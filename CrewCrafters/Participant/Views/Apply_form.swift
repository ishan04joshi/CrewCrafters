import SwiftUI

struct Apply_form: View {
    let tech_stack: String
    let hackathonId: String
    let teamid:String
    @EnvironmentObject var ApplyViewModel:ApplyViewModel
    @EnvironmentObject var userViewModel:UserViewModel
    
    
    @State private var showSuccessAlert = false
    @State private var navigateToHome = false
    
    var body: some View {
        VStack {
            Form {
                
                Section(header: Text("Personal Info")) {
                    TextField("Name", text: $ApplyViewModel.currentApplication.name)
                    TextField("Email", text: $ApplyViewModel.currentApplication.email)
                    TextField("Phone No.", text: $ApplyViewModel.currentApplication.phone)
                }
                
                Section(header: Text("Application Details")) {
                    Toggle("Share Profile", isOn: $ApplyViewModel.currentApplication.shareProfile)
                    TextField("GitHub Link", text: $ApplyViewModel.currentApplication.githubLink)
                    
                    
                    
                    VStack(alignment: .leading) {
                        Text("How are you suitable for this role:")
                        TextField("Brief description", text: $ApplyViewModel.currentApplication.suitability)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Previous Achievements")
                        TextField("Up to 3", text: $ApplyViewModel.currentApplication.achievements)
                    }
                }
            }
            .contentMargins(.horizontal, 5)
            
            Button(action: {
                ApplyViewModel.currentApplication.userId = userViewModel.userId
                ApplyViewModel.currentApplication.tech_stack=tech_stack
                ApplyViewModel.addNewApplication(ApplyViewModel.currentApplication, hackathonId: hackathonId, teamId: teamid, tech_stack: tech_stack){}
                submitApplication()
            }) {
                Text("Apply")
            }
            .buttonStyle(NavigationButton())
            .padding()
            .alert(isPresented: $showSuccessAlert) {
                Alert(title: Text("Application Submitted"), message: nil, dismissButton: .default(Text("OK")) {
                    navigateToHome = true
                })
            }
            .background(NavigationLink("", destination: Search(), isActive: $navigateToHome))
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Apply")
        .padding(.all, 7)
    }
    
    private func submitApplication() {
        // Here you would perform the actual submission logic
        // For now, let's just simulate a submission with a delay
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            showSuccessAlert = true
        }
    }
}

struct Home: View {
    var body: some View {
        Text("Home Screen")
    }
}

//struct Apply_form_Previews: PreviewProvider {
//    static var previews: some View {
//        Apply_form()
//    }
//}
