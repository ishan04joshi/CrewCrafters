import SwiftUI
import Firebase
import Foundation
import FirebaseFirestore
import FirebaseStorage


class HackathonViewModel: ObservableObject {
    @Published var hackathons: [Hackathon] = []
    @Published var currentHackathon: Hackathon = Hackathon(
            posterURL: nil,
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
    let defaultPoster = UIImage(named: "default_hackathon_poster")!
    private let db = Firestore.firestore()
    @EnvironmentObject var userViewModel: UserViewModel
    
    func fetchHackathons() {
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
                        hackathon.id = document.documentID
                        return hackathon
                    } catch {
                        print("Error decoding Hackathon: \(error)")
                        return nil
                    }
                }
            }
        }
    }
    
    func addNewHackathon(_ hackathon: Hackathon, posterImage: UIImage, completion: @escaping () -> Void) {
        // Convert UIImage to Data
        guard let imageData = posterImage.jpegData(compressionQuality: 0.1) else {
            print("Failed to convert image to data")
            return
        }
        
        // Reference to Firebase Storage
        let storageRef = Storage.storage().reference().child("hackathonPosters").child(UUID().uuidString)
        
        // Upload image data to Firebase Storage
        storageRef.putData(imageData, metadata: nil) { (metadata, error) in
            if let error = error {
                print("Error uploading image: \(error.localizedDescription)")
                return
            }
            
            // Retrieve the download URL of the uploaded image
            storageRef.downloadURL { (url, error) in
                guard let downloadURL = url else {
                    print("Error getting download URL: \(error?.localizedDescription ?? "")")
                    return
                }
                
                // Update the posterURL property of the hackathon object
                var newHackathon = hackathon
                newHackathon.posterURL = downloadURL.absoluteString
                
                // Add the modified hackathon object to Firestore
                do {
                    try self.db.collection("hackathons").addDocument(from: newHackathon) { error in
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
