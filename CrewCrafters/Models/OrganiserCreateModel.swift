//
//  OrganiserCreateModel.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 15/01/24.
//

import Foundation
import SwiftUI

struct OrganiserCreateHack: Identifiable {
    var id = UUID()
    var hackathonPoster: UIImage?
    var name: String
    var mode: String
    var theme_count: Int
    var selectedStartDate: Date
    var selectedEndDate: Date
    var prize1: String
    var prize2: String
    var prize3: String
    var problemStatement: [ProblemStatementInfo]
}

struct ProblemStatementInfo {
    var problem: String
    var description: String
    var theme: String
}
