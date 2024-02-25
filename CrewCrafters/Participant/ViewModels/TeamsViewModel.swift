//
//  TeamsViewModel.swift
//  CrewCrafters
//
//  Created by user1 on 22/02/24.
//

import Firebase
import Foundation
import SwiftUI


class TeamsViewModel: ObservableObject {
    @Published var teams: [Teams] = []
    
    @Published var currentTeam: Teams = Teams(
        name: "",
        theme: "",
        problem: "",
        member_count: 0,
        tech_stack: []
    )
    
    func addNewTeam(_ teams: Teams, hackathonId: String) { // Add hackathonId parameter
        let db = Firestore.firestore()
        do {
          try db.collection("hackathons/\(hackathonId)/teams").addDocument(data: [
            "name": teams.name,
            "theme": teams.theme,
            "problem": teams.problem,
            "member_count": teams.member_count,
            "techstack": teams.tech_stack,
            "hackathonId": hackathonId // Include hackathonId in the document data
          ])
          print("Document successfully written!")
        } catch {
          print("Error writing document: \(error)")
        }
    }
}
