//
//  OrganiserTabView.swift
//  CrewCrafters
//  Created by user1 on 18/01/24.
//

import SwiftUI

struct OrganiserTabView: View {
    var body: some View {
        TabView {
            Organizer_Home()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Organizer_Create()
                .tabItem {
                    Image(systemName: "plus")
                    Text("Create")
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

#Preview {
    OrganiserTabView()
}
