import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct Login: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var isLoggedIn: Bool = false
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var profileViewModel: ProfileViewModel
    var body: some View {
        VStack {
            Text("Sign In")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            TextField("Email Address", text: $email)
                .textFieldStyle(CustomTextFieldStyle())
                .padding(.bottom).autocapitalization(.none)
            
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
            
            HStack(spacing: 0) {
                Button(action: {
                    // Handle forgot password action
                }) {
                    Text("Forgot Password?")
                        .font(.subheadline)
                        .padding(.horizontal)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            .padding(.bottom)
            
            // Sign In Button
            NavigationLink(destination: determineDestinationView(), isActive: $isLoggedIn) {
                EmptyView()
            }
            Button(action: {
                signInWithFirebase()
            }) {
                Text("Sign In")
            }
            .buttonStyle(NavigationButton())
            .navigationBarHidden(true)
            
            HStack(spacing: 0) {
                Text("New around here? ")
                NavigationLink("Sign Up", destination: SignIn())
                    .foregroundColor(Color.blue)
            }
        }
        .padding()
    }
    
    // Function to determine the destination view based on user role
    private func determineDestinationView() -> some View {
        if userViewModel.userRole == "Participant" {
            return AnyView(MainTabView())
        } 
        else if userViewModel.userRole == "Admin"{
            return AnyView(OrganiserTabView())
        }
        else {
            return AnyView(OrganiserTabView())
        }
    }
    
    // Function to handle sign in with Firebase
    private func signInWithFirebase() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error signing in: \(error.localizedDescription)")
                // Handle error, show alert or provide feedback to the user
            } else {
                // Successful sign-in
                print("User signed in successfully")
                
                // Fetch user role from Firebase
                if let currentUser = Auth.auth().currentUser {
                    let userUID = currentUser.uid
                    userViewModel.userId=userUID
                    // Assuming you have a Firebase database where user roles are stored under "users" node
                    let db = Firestore.firestore()
                    let userRef = db.collection("users").document(userUID)
                    userRef.getDocument { document, error in
                        if let error = error {
                            print("Error fetching document: \(error.localizedDescription)")
                            // Handle error
                            return
                        }
                        
                        if let document = document, document.exists {
                            if let role = document.data()?["role"] as? String {
                                userViewModel.userRole = role
                                print("User role: \(role)")
                                
                                // Activate the navigation link to navigate to the appropriate view
                                self.isLoggedIn = true
                            } else {
                                print("Role field not found in document")
                                // Handle case when role field is not found
                            }
                        } else {
                            print("Document does not exist")
                            // Handle case when user document does not exist
                        }
                    }
                } else {
                    print("Current user is nil")
                    // Handle case when current user is nil
                }
            }
        }
    }
}
