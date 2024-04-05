//
//  MainTabView.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 30/12/23.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var hackathonViewModel: HackathonViewModel
    @EnvironmentObject var teamViewModel: TeamsViewModel
    var body: some View {
        TabView {
            ParticipantHome()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Search()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            Team_Space(hackathonIndex: 1)
                .tabItem {
                    Image(systemName: "person.2")
                    Text("Teams")
                }
            Profile()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
        }
        .navigationBarHidden(true)
    }
}

//#Preview {
//    MainTabView()
//}
