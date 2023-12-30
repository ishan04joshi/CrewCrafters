//
//  Onboarding.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 29/12/23.
//

import SwiftUI

struct Onboarding: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image("CrewCrafter")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
                Spacer()
                NavigationLink(
                    destination: SignIn().navigationBarHidden(true),
                    label: {
                        Text("Get Started")
                    })
                .buttonStyle(NavigationButton())
                .navigationBarHidden(true)
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    Onboarding()
}
