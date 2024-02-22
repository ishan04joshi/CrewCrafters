//
//  HackathonModel.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 26/01/24.
//

import Foundation
import SwiftUI


struct MemberInfo:Identifiable{
    var id =  UUID()
    var name: String
    var techstack: [String]
}

struct TeamsInfo: Identifiable{
    var id =  UUID()
    var teamPoster: UIImage?
    var name: String
    var memberCount: Int
    var filledPosition: Int
    var theme: String
    var problemStatement: [String]
    var techstack: [String]
    var details: String
}

struct HackathonTeams: Identifiable {
    var id = UUID()
    var name: String
    var teamInfo: [TeamsInfo]
}

struct Hackathon: Identifiable, Equatable {
    static func == (lhs: Hackathon, rhs: Hackathon) -> Bool {
        return lhs.id == rhs.id
    }
    var id = UUID()
    var hackathonPoster: UIImage?
    var name: String
    var about: String
    var mode: String
    var problem_count: Int
    var problemStatements: [String]
    var themes: [String]
    var startDate: Date
    var endDate: Date
    var partners: [UIImage]
    var prize: [String]
    var status: Bool
}
