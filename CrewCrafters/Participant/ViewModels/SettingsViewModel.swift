//
//  SettingsViewModel.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 21/12/23.
//

import Foundation
import SwiftUI

class SettingsViewModel: ObservableObject{
   // Make userViewModel a published property
    let setting: [SectionSettings] = [
        SectionSettings(header: "Account", settings: [
            Setting(title: "Edit profile", imageName: "person.crop.circle"),
            Setting(title: "Security", imageName: "shield.lefthalf.filled"),
            Setting(title: "Notifications", imageName: "bell.badge.fill"),
            Setting(title: "Privacy", imageName: "lock.fill")
        ]),
        SectionSettings(header: "Support & About", settings: [
            Setting(title: "Subscription", imageName: "creditcard.fill"),
            Setting(title: "Help & Support", imageName: "person.fill.questionmark"),
            Setting(title: "Terms & Policies", imageName: "list.bullet.clipboard.fill"),
        ]),
        SectionSettings(header: "Cache & Cellular", settings: [
            Setting(title: "Free up Space", imageName: "trash.fill"),
            Setting(title: "Data Saver", imageName: "chart.line.downtrend.xyaxis"),
        ]),

        SectionSettings(header: "Actions", settings: [
            Setting(title: "Report a problem", imageName: "flag.badge.ellipsis"),
            Setting(title: "Add Account", imageName: "person.2.circle"),
            Setting(title: "Log Out", imageName: "rectangle.portrait.and.arrow.right"),
        ]),

    ]
    func logout() {
            // Perform logout actions here
       
        }
}
