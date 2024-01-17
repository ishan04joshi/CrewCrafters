//
//  SettingsModel.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 21/12/23.
//

import Foundation

struct Setting: Identifiable, Hashable {
    var id = UUID()
    let title: String
    let imageName: String
}

struct SectionSettings: Identifiable, Hashable {
    var id = UUID()
    let header: String
    let settings: [Setting]
}
