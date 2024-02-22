import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct SignIn: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var roleSelection: Int = 0 // 0 for Organizer, 1 for Participant
    @State private var isSignedUp: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Sign Up")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                TextField("First Name", text: $firstName)
                    .textFieldStyle(CustomTextFieldStyle())
                    .padding(.bottom)
                
                TextField("Last Name", text: $lastName)
                    .textFieldStyle(CustomTextFieldStyle())
                    .padding(.bottom)
                
                TextField("Email Address", text: $email)
                    .textFieldStyle(CustomTextFieldStyle())
                    .padding(.bottom).autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                
                ZStack(alignment: .trailingFirstTextBaseline) {
                    if isPasswordVisible {
                        TextField("Password", text: $password)
                            .textFieldStyle(CustomTextFieldStyle())
                    } else {
                        SecureField("Password", text: $password)
                            .textFieldStyle(CustomTextFieldStyle())
                    }
                    
                    Button(action: {
                        isPasswordVisible.toggle()
                        if isPasswordVisible {
                            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
                                isPasswordVisible = false
                            }
                        }
                    }) {
                        Image(systemName: "eye")
                            .padding(.trailing, 10)
                            .foregroundColor(Color.gray)
                    }
                    .padding(.trailing, 20)
                }
                
                Picker(selection: $roleSelection, label: Text("Select Role")) {
                    Text("Organizer").tag(0)
                    Text("Participant").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.bottom)
                
                // Sign Up Button
                NavigationLink(destination: roleSelection == 0 ? AnyView(OrganiserTabView()) : AnyView(MainTabView()), isActive: $isSignedUp) {
                    EmptyView()
                }

                Button(action: {
                    signUpWithFirebase()
                }) {
                    Text("Sign Up")
                }
                .buttonStyle(NavigationButton())
                .navigationBarHidden(true)
                .padding()
                
                // Your other UI components
            }
        }
    }
    
    // Function to handle sign up with Firebase
    func signUpWithFirebase() {
        let role = roleSelection == 0 ? UserRole.organizer : UserRole.participant
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error signing up: \(error.localizedDescription)")
                // Handle error, show alert or provide feedback to the user
            } else {
                // Successful sign-up
                print("User signed up successfully as \(role)")
                
                // Add user information to Firestore
                addUserToFirestore(firstName: firstName, lastName: lastName, email: email, role: role)
                
                // Set current user in ViewModel
                
                self.isSignedUp = true // Activate the navigation link
            }
        }
    }

    
    func addUserToFirestore(firstName: String, lastName: String, email: String, role: UserRole) {
        let db = Firestore.firestore()
        if let currentUserUID = Auth.auth().currentUser?.uid {
            // Set document ID to the user's authentication UID
            db.collection("users").document(currentUserUID).setData([
                "firstName": firstName,
                "lastName": lastName,
                "email": email,
                "role": role == .organizer ? "Organizer" : "Participant"
            ]) { error in
                if let error = error {
                    print("Error adding document: \(error)")
                } else {
                    print("Document added successfully")
                }
            }
        } else {
            print("Error: Current user not available")
        }
    }

}

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .font(.headline)
            .frame(height: 25)
            .padding()
            .background(Color.black.opacity(0.04))
            .cornerRadius(50)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
