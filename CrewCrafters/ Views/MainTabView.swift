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
            ParticipantHome(hackathonIndex: 1)
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


struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(HackathonViewModel())
            .environmentObject(TeamsViewModel())
    }
}

