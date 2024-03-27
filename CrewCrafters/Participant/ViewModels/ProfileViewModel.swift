import Foundation
import SwiftUI
import FirebaseFirestore

class ProfileViewModel: ObservableObject {
    @Published var currentProfile: ProfileM = ProfileM(
        profilephotoData: nil,
        name: "",
        bio: "",
        techstack: ["","","",""],
        about: ""
    )
    @Published var anyProfile: ProfileM = ProfileM(
        profilephotoData: nil,
        name: "",
        bio: "",
        techstack: ["","","",""],
        about: ""
    )
    @Published var manyProfile: ProfileM = ProfileM(
        profilephotoData: nil,
        name: "",
        bio: "",
        techstack: ["","","",""],
        about: ""
    )
    let defaultcover = UIImage(named: "bg")!
    let defaultphoto = UIImage(named: "bg")!
    private let db = Firestore.firestore()
    @EnvironmentObject var userViewModel: UserViewModel
    
    func fetchProfile(userId: String) {
        guard !userId.isEmpty else {
            print("Invalid userId")
            return
        }
        
        db.collection("users/\(userId)/profiles").getDocuments { querySnapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                guard let document = querySnapshot?.documents.first else {
                    print("No documents")
                    return
                }
                
                do {
                    self.currentProfile = try document.data(as: ProfileM.self)
                } catch {
                    print("Error decoding Profile: \(error)")
                }
            }
        }
    }
    
    func fetchanyProfile(userId: String) {
        guard !userId.isEmpty else {
            print("Invalid userId")
            return
        }
        
        db.collection("users/\(userId)/profiles").getDocuments { querySnapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                guard let document = querySnapshot?.documents.first else {
                    print("No documents")
                    return
                }
                
                do {
                    self.anyProfile = try document.data(as: ProfileM.self)
                } catch {
                    print("Error decoding Profile: \(error)")
                }
            }
        }
    }
    
    func addNewProfile(_ profile: ProfileM, userId: String, completion: @escaping () -> Void) {
        guard !userId.isEmpty else {
            print("Invalid userId")
            return
        }
        
        do {
            try db.collection("users/\(userId)/profiles").addDocument(from: profile) { error in
                if let error = error {
                    print("Error writing document: \(error)")
                } else {
                    print("Document successfully written!")
                    self.fetchProfile(userId: userId)
                    completion()
                }
            }
        } catch {
            print("Error writing document: \(error)")
        }
    }
    func fetchmanyProfile(userId: String, completion: @escaping (ProfileM?) -> Void) {
            guard !userId.isEmpty else {
                print("Invalid userId")
                completion(nil)
                return
            }
            
            db.collection("users/\(userId)/profiles").getDocuments { querySnapshot, error in
                if let error = error {
                    print("Error getting documents: \(error)")
                    completion(nil)
                } else {
                    guard let document = querySnapshot?.documents.first else {
                        print("No documents")
                        completion(nil)
                        return
                    }
                    
                    do {
                        let profile = try document.data(as: ProfileM.self)
                        completion(profile)
                    } catch {
                        print("Error decoding Profile: \(error)")
                        completion(nil)
                    }
                }
            }
        }
    
   

}
