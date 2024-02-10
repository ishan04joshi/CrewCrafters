//
//  CrewCraftersApp.swift
//  CrewCrafters
//
//  Created by user1 on 08/12/23.
//

import SwiftUI
import FirebaseCore

@main
struct CrewCraftersApp: App {
    init()
    {
        FirebaseApp.configure()
    }   
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
