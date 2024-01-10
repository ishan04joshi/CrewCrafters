//
//  Notification.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 30/12/23.
//

import SwiftUI

struct NotificationItem: Identifiable {
    var id = UUID()
    var title: String
    var message: String
}

struct Notification: View {
    @State private var notifications: [NotificationItem] = [
        NotificationItem(title: "Application Update", message: "Applied in Ocean Hackathon"),
        NotificationItem(title: "Reminder", message: "Ocean Hackathon starts in 2 days"),
        
    ]

    var body: some View {
        VStack {
            List(notifications) { notification in
                NavigationLink(destination: Text(notification.message)) {
                    VStack(alignment: .leading) {
                        Text(notification.title)
                            .font(.headline)
                        Text(notification.message)
                            .foregroundColor(.gray)
                            .lineLimit(1)
                    }
                }
            }
            .navigationBarTitle("Notifications")
        }
    }
}


#Preview {
    Notification()
}
