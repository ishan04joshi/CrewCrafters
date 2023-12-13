//
//  ContentView.swift
//  CrewCrafters
//
//  Created by user1 on 08/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Home().tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            Profile().tabItem {
                Image(systemName: "person.crop.circle")
                Text("Profile")
            }
            Search().tabItem {
                Image(systemName: "magnifyingglass.circle.fill")
                Text("Search")
            }
            Leaderboard().tabItem {
                Image(systemName: "chart.bar.fill")
                Text("LeaderBoard")
            }
            
            
        }
         
        
    }
}

#Preview {
    ContentView()
}
