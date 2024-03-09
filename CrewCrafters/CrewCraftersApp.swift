//
//  CrewCraftersApp.swift
//  CrewCrafters
//
//  Created by user1 on 08/12/23.
//

import SwiftUI
import FirebaseCore
import FirebaseAppCheck
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
@main


struct CrewCraftersApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
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
