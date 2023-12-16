//
//  HackLandModel.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 15/12/23.
//

import Foundation

struct HackLandThemeListItem: Identifiable {
    var id = UUID()
    var title: String
}

struct HackLandTimelineListItem: Identifiable {
    var id = UUID()
    var title: String
    var desc: String
}
