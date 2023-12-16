//
//  LeaderboardModel.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 16/12/23.
//

import Foundation

struct LeaderboardListItem: Identifiable {
    var id = UUID()
    var count: Int
    var username: String
    var image: String
    var points: Int
}
