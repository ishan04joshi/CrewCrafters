import SwiftUI
import FirebaseAuth

struct Login: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var userole: String = ""
    @State private var isLoggedIn: Bool = false

    var body: some View {
        VStack {
            Text("Sign In")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            TextField("Email Address", text: $email)
                .textFieldStyle(CustomTextFieldStyle())
                .padding(.bottom)
            
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
                NavigationLink("Sign Up", destination: SignIn().navigationBarHidden(true))
                    .foregroundColor(Color.blue)
            }
        }
        .padding()
    }
    
    // Function to determine the destination view based on user role
    private func determineDestinationView() -> some View {
        if userole=="abc" {
            return AnyView(MainTabView())
        } else {
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
                
                // Update the view model or perform any necessary operations
                
                // Activate the navigation link to navigate to the appropriate view
                self.isLoggedIn = true
            }
        }
    }
}
