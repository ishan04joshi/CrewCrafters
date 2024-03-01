//
//  CrewCraftersApp.swift
//  CrewCrafters
//
//  Created by user1 on 08/12/23.
//

import SwiftUI
import FirebaseCore
import FirebaseAppCheck

@main
struct CrewCraftersApp: App {
    init()
    {
        let providerFactory = AppCheckDebugProviderFactory()
        AppCheck.setAppCheckProviderFactory(providerFactory)

        FirebaseApp.configure()
    }
    @StateObject private var userViewModel = UserViewModel()
    @StateObject private var hackathonViewModel = HackathonViewModel()
    @StateObject private var teamViewModel = TeamsViewModel()
    @StateObject private var profileViewModel = ProfileViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userViewModel)
                .environmentObject(hackathonViewModel)
                .environmentObject(teamViewModel)
                .environmentObject(profileViewModel)
        }
    }
}
