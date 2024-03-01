//
//  ProfileViewModel.swift
//  CrewCrafters
//
//  Created by user35 on 01/03/24.
//

import Foundation
import SwiftUI
class ProfileViewModel: ObservableObject {
    @Published var currentHackathon: ProfileM = ProfileM(
        coverphotoData: nil,
        profilephotoData: nil,
        name: "",
        bio: "",
        techstack: [],
        achievementsData: [],
        about: ""
        )
    let defaultPoster = UIImage(named: "default_hackathon_poster")!

    
   
    
    func fetchProfile() {
        db.collection("hackathons").getDocuments { querySnapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                
                self.hackathons = documents.compactMap { document in
                    do {
                        var hackathon = try document.data(as: Hackathon.self)
                        hackathon.id = document.documentID // Set the hackathon ID
                        return hackathon
                    } catch {
                        print("Error decoding Hackathon: \(error)")
                        return nil
                    }
                }
            }
        }
    }
    
    func addNewHackathon(_ hackathon: Hackathon, completion: @escaping () -> Void) {
        do {
            try db.collection("hackathons").addDocument(from: hackathon) { error in
                if let error = error {
                    print("Error writing document: \(error)")
                } else {
                    print("Document successfully written!")
                    self.fetchHackathons()
                    completion()
                }
            }
        } catch {
            print("Error writing document: \(error)")
        }
    }
    
    func filteredHackathons() -> [Hackathon] {
        let userRole = userViewModel.userRole
        
        if userRole == "Organizer" {
            return hackathons
        } else if userRole == "Participant" {
            return hackathons.filter { $0.status }
        } else {
            // Handle other cases or return an empty array
            return []
        }
    }
}

