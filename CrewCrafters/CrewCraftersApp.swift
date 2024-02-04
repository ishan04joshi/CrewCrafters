//
//  CrewCraftersApp.swift
//  CrewCrafters
//
//  Created by user1 on 08/12/23.
//

import SwiftUI

@main
struct CrewCraftersApp: App {
    @StateObject private var onboardingViewModel = OnboardingViewModel()
    @StateObject private var hackathonViewModel = HackathonViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(onboardingViewModel)
                .environmentObject(hackathonViewModel)
        }
    }
}
