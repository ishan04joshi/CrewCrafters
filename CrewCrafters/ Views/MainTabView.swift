//
//  MainTabView.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 30/12/23.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var hackathonViewModel: HackathonViewModel
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
            Leaderboard()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("LeaderBoard")
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
