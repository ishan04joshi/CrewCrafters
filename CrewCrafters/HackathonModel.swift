//
//  HackathonModel.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 26/01/24.
//

import Foundation
import SwiftUI
import UIKit

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

struct Hackathon: Identifiable, Equatable, Codable {
    static func == (lhs: Hackathon, rhs: Hackathon) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id = UUID()
    var hackathonPosterData: Data?
    var name: String
    var about: String
    var mode: String
    var problem_count: Int
    var problemStatements: [String]
    var themes: [String]
    var startDate: Date
    var endDate: Date
    var partnerImagesData: [Data]
    var prize: [String]
    var status: Bool
    
    var hackathonPoster: UIImage? {
        get {
            guard let data = hackathonPosterData else { return nil }
            return UIImage(data: data)
        }
        set {
            hackathonPosterData = newValue?.jpegData(compressionQuality: 0.1)
        }
    }
    
    var partners: [UIImage] {
        get {
            return partnerImagesData.compactMap { UIImage(data: $0) }
        }
        set {
            partnerImagesData = newValue.compactMap { $0.jpegData(compressionQuality: 0.1) }
        }
    }
}
