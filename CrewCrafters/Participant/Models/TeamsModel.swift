//  TeamsModel.swift
//  CrewCrafters
//
//  Created by user1 on 22/02/24.
//

import Foundation
import SwiftUI


struct Teams: Identifiable, Equatable {
    static func == (lhs: Teams, rhs: Teams) -> Bool {
        return lhs.id == rhs.id
    }
    var id = UUID()
    var name: String
    var theme: String
    var problem: String
    var member_count: Int
    var tech_stack: [String]
    
}
