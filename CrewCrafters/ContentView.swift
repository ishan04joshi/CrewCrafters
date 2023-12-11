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
            Hack_Land().tabItem {
                Image(systemName: "chart.bar.fill")
                Text("LeaderBoard")
            }
            
            Settings().tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }
        }
         
        
    }
}

#Preview {
    ContentView()
}
