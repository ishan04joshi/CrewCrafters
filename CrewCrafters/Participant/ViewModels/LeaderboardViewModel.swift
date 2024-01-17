//
//  LeaderboardViewModel.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 16/12/23.
//

import Foundation

class LeaderboardViewModel: ObservableObject {
    @Published var items: [LeaderboardListItem] = [
        LeaderboardListItem(count: 3, username: "Jeff Bezos", image: "user", points: 30),
        LeaderboardListItem(count: 4, username: "Bill Gates", image: "user", points: 28),
        LeaderboardListItem(count: 5, username: "Mark Zuck", image: "user", points: 25),
        LeaderboardListItem(count: 6, username: "Warren Buffett", image: "user", points: 22),
        LeaderboardListItem(count: 7, username: "Larry Page", image: "user", points: 20),
        LeaderboardListItem(count: 8, username: "Sergey Brin", image: "user", points: 18),
        LeaderboardListItem(count: 9, username: "Larry Ellison", image: "user", points: 15),
        LeaderboardListItem(count: 10, username: "Mike Bloom", image: "user", points: 12)
    ]
}
