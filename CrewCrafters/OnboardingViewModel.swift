import Foundation
import Firebase
import FirebaseAuth

class UserViewModel: ObservableObject {
    @Published var userRole: String = ""
    @Published var userId: String = ""
    @Published var role: String = ""
    @Published var currentUser: Bool = false
    

    func checkUserLoggedIn() {
        if let _ = Auth.auth().currentUser {
            // User is signed in, fetch user role
            getUserRole()
        }
    }

    func getUserRole() {
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        
        // Set the userId property
        self.userId = currentUser.uid
        
        let userRef = Firestore.firestore().collection("users").document(userId)
        
        userRef.getDocument { [weak self] document, error in
            if let document = document, document.exists {
                if let role = document.data()?["role"] as? String {
                    self?.userRole = role
                }
            } else {
                print("Document does not exist")
            }
        }
    }
}
