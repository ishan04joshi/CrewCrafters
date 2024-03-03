import SwiftUI

struct Apply_form: View {
    @State var name: String = ""
    @State var email: String = ""
    @State var phone: String = ""
    @State var shareProfile = true
    @State private var role = "Web Dev"
    let position = ["Web Dev", "App Dev", "Cloud Engg.", "AI Engg.", "Backend Dev"]
    @State var githubLink: String = ""
    @State var suitability: String = ""
    @State var achievements: String = ""
    
    @State private var showSuccessAlert = false
    @State private var navigateToHome = false
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("Name", text: $name)
                    TextField("Email", text: $email)
                    TextField("Phone No.", text: $phone)
                }
                
                Section(header: Text("Application Details")) {
                    Toggle("Share Profile", isOn: $shareProfile)
                    TextField("GitHub Link", text: $githubLink)
                    
                    Picker("Preferred Position", selection: $role) {
                        ForEach(position, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("How are you suitable for this role:")
                        TextField("Brief description", text: $suitability)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Previous Achievements")
                        TextField("Up to 3", text: $achievements)
                    }
                }
            }
            .contentMargins(.horizontal, 5)
            
            Button(action: {
                submitApplication()
            }) {
                Text("Apply")
            }
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

struct Apply_form_Previews: PreviewProvider {
    static var previews: some View {
        Apply_form()
    }
}
