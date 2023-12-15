//
//  Home.swift
//  CrewCrafters
//
//  Created by user1 on 09/12/23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ZStack{
            Color.gray
            Text(" This is Home")
        }
    }
}
func goHackLand() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: Hack_Land(title: String()))
        window.makeKeyAndVisible()
    }
}
func goSearch() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: Search())
        window.makeKeyAndVisible()
    }
}
func goHome() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: ContentView())
        window.makeKeyAndVisible()
    }
}
func gohacks() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: Hack_teams())
        window.makeKeyAndVisible()
    }
}
func goTeamCreate() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: Team_create())
        window.makeKeyAndVisible()
    }
}
func goTeaminfo() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: Team_info())
        window.makeKeyAndVisible()
    }
}
#Preview {
    Home()
}
