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
func goHome() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: ContentView())
        window.makeKeyAndVisible()
    }
}

#Preview {
    Home()
}
