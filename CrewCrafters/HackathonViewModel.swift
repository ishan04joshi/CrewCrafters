//
//  HackathonViewModel.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 26/01/24.
//

import SwiftUI
import Firebase
import Foundation
import FirebaseFirestore

class HackathonViewModel: ObservableObject {
    @Published var hackathons: [Hackathon] = []
    let defaultPoster = UIImage(named: "default_hackathon_poster")!
    private let db = Firestore.firestore()
    @EnvironmentObject var userViewModel: UserViewModel
    
    init() {
        fetchHackathons()
    }
    
    @Published var currentHackathon: Hackathon = Hackathon(
        hackathonPosterData: nil,
        name: "",
        about: "",
        mode: "",
        problem_count: 1,
        problemStatements: [],
        themes: [],
        startDate: Date(),
        endDate: Date(),
        partnerImagesData: [],
        prize: [],
        status: false
    )
    
    func fetchHackathons() {
        db.collection("test2").getDocuments { querySnapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                
                self.hackathons = documents.compactMap { document in
                    do {
                        return try document.data(as: Hackathon.self)
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
            try db.collection("test2").addDocument(from: hackathon) { error in
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
