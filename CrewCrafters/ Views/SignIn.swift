import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import Combine
struct SignIn: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var roleSelection: Int = 0
    @State private var selected: String = "" // 0 for Organizer, 1 for Participant
    @State private var isSignedUp: Bool = false
    @State private var navigationIsActive = false
    
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
                    .padding(.bottom)
                    .autocapitalization(.none)
                
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
                            Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { _ in
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
                .padding(.bottom)
                
                Picker(selection: $roleSelection, label: Text("Select Role")) {
                    Text("Organizer")
                        .tag(0)
                    Text("Participant")
                        .tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                )
                .padding()
                .onChange(of: roleSelection) { newValue in
                    selected = newValue == 0 ? "Organizer" : "Participant"
                }
                
                Button(action: {
                    signUpWithFirebase()
                }) {
                    Text("Sign Up")
                }
                .buttonStyle(NavigationButton())
                .navigationBarHidden(true)
                .padding(.horizontal)
                
                HStack(spacing: 0) {
                    Text("Already a member? ")
                    NavigationLink("Sign In", destination: Login())
                        .foregroundColor(Color.blue)
                }
                
            }
            .padding(.horizontal)
            .background(
                NavigationLink(destination: roleSelection == 0 ? AnyView(OrganiserTabView()) : AnyView(Profile_Create()), isActive: $navigationIsActive) {
                    EmptyView()
                }
                    .hidden()
            )
        }
        .onReceive(Just(isSignedUp)) {
            if $0 {
                navigationIsActive = true
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func signUpWithFirebase() {
        let role = roleSelection == 0 ? "Organizer" : "Participant"
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error signing up: \(error.localizedDescription)")
                // Handle error, show alert or provide feedback to the user
            } else {
                print("User signed up successfully as \(role)")
                if roleSelection == 0{
                    userViewModel.userRole = role
                }
                else{
                    userViewModel.role=role
                }
                addUserToFirestore(firstName: firstName, lastName: lastName, email: email, role: role)
                
                self.isSignedUp = true // Activate the navigation link
            }
        }
    }
    
    func addUserToFirestore(firstName: String, lastName: String, email: String, role: String) {
        let db = Firestore.firestore()
        if let currentUserUID = Auth.auth().currentUser?.uid {
            userViewModel.userId = currentUserUID
            db.collection("users").document(currentUserUID).setData([
                "firstName": firstName,
                "lastName": lastName,
                "email": email,
                "role": role
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

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignIn()
//    }
//}
