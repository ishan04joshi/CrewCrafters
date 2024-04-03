//
//  TeamsViewModel.swift
//  CrewCrafters
//
//  Created by user1 on 22/02/24.
//

import Firebase
import Foundation
import SwiftUI
import FirebaseFirestore

class TeamsViewModel: ObservableObject {
    @Published var teams: [Teams] = []
    let db = Firestore.firestore()
    let defaultphoto = UIImage(named: "bg")!
    @EnvironmentObject var userViewModel: UserViewModel
    @Published var currentTeam: Teams = Teams(
        teamphotoData: nil,
        id:"",
        admin_id:"",
        name: "",
        theme: "",
        problem: "",
        member_count: 0,
        tech_stack: [],
        hackathonId: ""
    )
    
    func addNewTeam(_ team: Teams, hackathonId: String, aid:String, completion: @escaping () -> Void) {
        let adminId = aid // Assuming userViewModel.userId represents the admin's ID
        
        // Add admin ID to the team document
        var teamWithAdminId = team
        teamWithAdminId.admin_id = adminId
        
        do {
            // Declare newDocumentRef here
            var newDocumentRef: DocumentReference?
            
            // Add the team document to Firestore
            newDocumentRef = try db.collection("hackathons/\(hackathonId)/teams").addDocument(from: teamWithAdminId) { error in
                if let error = error {
                    print("Error writing document: \(error)")
                } else {
                    print("Document successfully written!")
                    
                    // Fetch the newly created document to get its ID
                    newDocumentRef?.getDocument { (documentSnapshot, error) in
                        if let error = error {
                            print("Error fetching document: \(error)")
                            return
                        }
                        
                        guard let teamId = documentSnapshot?.documentID else {
                            print("Failed to get document ID for the team.")
                            return
                        }
                        
                        // Add admin ID as a member subcollection
                        let adminData: [String: Any] = [
                            "admin_id": adminId,
                            // Add any other admin-related data if needed
                        ]
                        self.db.collection("hackathons/\(hackathonId)/teams/\(teamId)/members").document("members").setData(adminData) { error in
                            if let error = error {
                                print("Error adding admin data: \(error)")
                            } else {
                                print("Admin data added successfully!")
                            }
                            
                            // Fetch updated teams
                            self.fetchTeams(hackathonId: hackathonId)
                            completion()
                        }
                    }
                }
            }
        } catch {
            // Handle any errors thrown during the process
            print("Error adding document to Firestore: \(error)")
        }
    }






    
    func fetchTeams(hackathonId: String) {
        db.collection("hackathons/\(hackathonId)/teams").getDocuments { querySnapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                
                self.teams = documents.compactMap { document in
                    do {
                        var team = try document.data(as: Teams.self)
                        team.id = document.documentID
                        return team
                    } catch {
                        print("Error decoding Teams: \(error)")
                        return nil
                    }
                }
            }
        }
    }
    
    func fetchTeamCount(for hackathonId: String, completion: @escaping (Int) -> Void) {
        db.collection("hackathons/\(hackathonId)/teams").getDocuments { querySnapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
                completion(0)
            } else {
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    completion(0)
                    return
                }
                
                let teamCount = documents.count
                completion(teamCount)
            }
        }
    }
    
    func fetchTeamPosters(for hackathonId: String, completion: @escaping ([UIImage]) -> Void) {
        var posters: [UIImage] = []
        db.collection("hackathons/\(hackathonId)/teams").getDocuments { querySnapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
                completion(posters)
            } else {
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    completion(posters)
                    return
                }
                
                let dispatchGroup = DispatchGroup()
                for document in documents {
                    dispatchGroup.enter()
                    let teamData = document.data()
                    if let teamPhotoData = teamData["teamphotoData"] as? Data,
                       let teamPoster = UIImage(data: teamPhotoData) {
                        posters.append(teamPoster)
                    }
                    dispatchGroup.leave()
                }
                
                dispatchGroup.notify(queue: .main) {
                    completion(posters)
                }
            }
        }
    }
    
}
