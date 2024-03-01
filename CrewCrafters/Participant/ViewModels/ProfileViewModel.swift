//
//  ProfileViewModel.swift
//  CrewCrafters
//
//  Created by user35 on 01/03/24.
//

import Foundation
import SwiftUI
import FirebaseFirestore
class ProfileViewModel: ObservableObject {
    @Published var currentProfile: ProfileM = ProfileM(
        coverphotoData: nil,
        profilephotoData: nil,
        name: "",
        bio: "",
        techstack: [],
        achievementsData: [],
        about: ""
        )
    let defaultPoster = UIImage(named: "default_hackathon_poster")!
    private let db = Firestore.firestore()
    
   
    
    func fetchProfile(userId:String) {
            db.collection("users/\(userId)/profile").getDocuments { querySnapshot, error in
                if let error = error {
                    print("Error getting documents: \(error)")
                } else {
                    guard let document = querySnapshot?.documents.first else {
                        print("No documents")
                        return
                    }
                    
                    do {
                        self.currentProfile = try document.data(as: ProfileM.self)
                        self.currentProfile.id = document.documentID // Set the hackathon ID
                    } catch {
                        print("Error decoding Hackathon: \(error)")
                    }
                }
            }
        }
    
    func addNewProfile(_ hackathon: Hackathon,userId:String, completion: @escaping () -> Void) {
            do {
                try db.collection("users/\(userId)/profiles").addDocument(from: hackathon) { error in
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
    
    
}

