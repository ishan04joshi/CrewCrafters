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
    
    @Published var currentTeam: Teams = Teams(
        name: "",
        theme: "",
        problem: "",
        member_count: 0,
        tech_stack: [],
        hackathonId: ""
    )

    
    func addNewTeam(_ teams: Teams, hackathonId: String) { // Add hackathonId parameter
        
        do {
          try db.collection("hackathons/\(hackathonId)/teams").addDocument(data: [
            "id": "",
            "name": teams.name,
            "theme": teams.theme,
            "problem": teams.problem,
            "member_count": teams.member_count,
            "tech_stack": teams.tech_stack,
            "hackathonId": hackathonId // Include hackathonId in the document data
          ])
          print("Document successfully written!")
        } catch {
          print("Error writing document: \(error)")
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
                        team.id = document.documentID // Set the hackathon ID
                        return team
                    } catch {
                        print("Error decoding Teams: \(error)")
                        return nil
                    }
                }
            }
        }
    }
    
    
}
