
import Foundation
import SwiftUI
import FirebaseFirestore
class ApplyViewModel: ObservableObject {
    @Published var applications: [ApplyModel] = []
    @EnvironmentObject var userViewModel: UserViewModel
    @Published var currentApplication: ApplyModel = ApplyModel(
        id:"",
        name: "",
        email: "",
        phone: "",
        shareProfile: true,
        githubLink: "",
        suitability: "",
        achievements: "",
        status: 0,
        userId:""
        )
     let db = Firestore.firestore()
   
   
    

    func fetchApplication(hackathonId:String,teamId:String,tech_stack:String) {
        db.collection("hackathons/\(hackathonId)/teams/\(teamId)/\(tech_stack)").getDocuments { querySnapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                
                self.applications = documents.compactMap { document in
                    do {
                        var apply = try document.data(as: ApplyModel.self)
                        apply.id = document.documentID
                        return apply
                    } catch {
                        print("Error decoding Teams: \(error)")
                        return nil
                    }
                }
            }
        }
    }

    
    func addNewApplication(_ apply: ApplyModel,hackathonId:String,teamId:String,tech_stack:String,completion: @escaping () -> Void) {
            do {
                try db.collection("hackathons/\(hackathonId)/teams/\(teamId)/\(tech_stack)").addDocument(from: apply) { error in
                    if let error = error {
                        print("Error writing document: \(error)")
                    } else {
                        print("Document successfully written!")
                        self.fetchApplication(hackathonId:hackathonId,teamId:teamId,tech_stack:tech_stack)
                        completion()
                        
                    }
                }
            } catch {
                print("Error writing document: \(error)")
            }
        }
    
    
}

