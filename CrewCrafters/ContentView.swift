//
//  ContentView.swift
//  CrewCrafters
//
//  Created by user1 on 08/12/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

struct ContentView: View {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some View {
        NavigationView {
            Onboarding()
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    ContentView()
}
