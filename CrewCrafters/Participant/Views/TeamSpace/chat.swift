import SwiftUI
import FirebaseFirestore

struct ChatView: View {
    let teamIndex: Int
    @EnvironmentObject var hackathonViewModel: HackathonViewModel
    @EnvironmentObject var teamViewModel: TeamsViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var messageText = ""
    @State private var messages: [Message] = [] // Store received messages
    @State private var uniqueId: String = "" // Unique identifier
    
    var body: some View {
        
        VStack {
            // List to display messages, reversed to show latest at the bottom
            List(messages, id: \.self) { message in
                // Set alignment of text based on sender's ID
                Text(message.text)
                    .padding(10)
                    .background(message.senderId == userViewModel.userId ? Color.blue : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .frame(maxWidth: .infinity, alignment: message.senderId == userViewModel.userId ? .trailing : .leading)
            }
            .listStyle(PlainListStyle()) // To remove default list styling
            
            // Input field and send button
            ZStack(alignment: .trailing){
                TextField ("Message...", text: $messageText, axis: .vertical)
                    .padding (12)
                    .padding(.trailing, 48)
                    .background (Color (.systemGroupedBackground) )
                    .clipShape (Capsule())
                    .font (.subheadline)
                Button(action: sendMessage) {
                    Text("Send")
                        .fontWeight(.semibold)
                }.padding(.horizontal)
            }
        }
        .onAppear {
            // Fetch initial messages
            fetchMessages()
            
            // Generate unique identifier
            uniqueId = UserDefaults.standard.string(forKey: "uniqueId") ?? UUID().uuidString
            // Store unique identifier persistently
            UserDefaults.standard.set(uniqueId, forKey: "uniqueId")
        }
    }
    
    private func fetchMessages() {
        // Access Firestore collection and listen for changes
        let db = Firestore.firestore()
        
        // Ensure the collection name doesn't contain invalid characters
        let teamName = teamViewModel.teams[teamIndex].name.replacingOccurrences(of: "/", with: "_")
        let collectionPath = "messages/\(teamViewModel.teams[teamIndex].admin_id)/\(teamName)"
        
        // Check if the collection exists
        db.collection(collectionPath).document("dummy").getDocument { snapshot, error in
            guard let snapshot = snapshot, !snapshot.exists else {
                // Collection doesn't exist, create it
                db.collection(collectionPath).document("dummy").setData([:]) { error in
                    if let error = error {
                        print("Error creating collection: \(error)")
                    } else {
                        print("Collection created successfully")
                        // Fetch messages after creating the collection
                        self.fetchMessagesFromCollection(db.collection(collectionPath))
                    }
                }
                return
            }
            
            // Collection exists, fetch messages
            self.fetchMessagesFromCollection(db.collection(collectionPath))
        }
    }
    
    private func fetchMessagesFromCollection(_ collectionRef: CollectionReference) {
        // Fetch messages from the collection
        collectionRef.addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(error!)")
                return
            }
            
            // Parse documents to get messages
            self.messages = documents.compactMap { document in
                if let text = document["message"] as? String,
                   let senderId = document["senderId"] as? String,
                   let timestamp = document["timestamp"] as? Timestamp {
                    return Message(text: text, senderId: senderId, timestamp: timestamp.dateValue())
                }
                return nil
            }
            // Sort messages by timestamp in descending order
            self.messages.sort(by: { $0.timestamp < $1.timestamp })
        }
    }

    
    private func sendMessage() {
        // Get the current timestamp
        let timestamp = Timestamp(date: Date())
        
        // Send message to Firestore
        let db = Firestore.firestore()
        
        // Ensure the collection name doesn't contain invalid characters
        let teamName = teamViewModel.teams[teamIndex].name.replacingOccurrences(of: "/", with: "_")
        let collectionPath = "messages/\(teamViewModel.teams[teamIndex].admin_id)/\(teamName)"
        
        db.collection(collectionPath).addDocument(data: [
            "message": messageText,
            "senderId": userViewModel.userId, // Assuming userViewModel.userId is sender's ID
            "timestamp": timestamp // Add timestamp field
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Message sent successfully")
            }
        }
        
        // Clear text field
        messageText = ""
    }
}

struct Message: Hashable {
    let text: String
    let senderId: String
    let timestamp: Date // Include timestamp in Message model
}
