//
//  ContentView.swift
//  CrewCrafters
//
//  Created by user1 on 08/12/23.
//

import SwiftUI

struct ContentView: View {
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
