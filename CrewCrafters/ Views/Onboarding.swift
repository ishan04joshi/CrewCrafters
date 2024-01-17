//
//  Onboarding.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 29/12/23.
//

import SwiftUI

struct Onboarding: View {
    @EnvironmentObject private var viewModel: OnboardingViewModel
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

                NavigationLink(destination: SignIn(onboardingViewModel: viewModel)) {
                    Text("Sign In as Participant")
                }
                .simultaneousGesture(TapGesture().onEnded{
                    viewModel.signInAsParticipant()
                })
                .buttonStyle(NavigationButton())
                .navigationBarHidden(true)
                
                NavigationLink(destination: SignIn(onboardingViewModel: viewModel)) {
                    Text("Sign In as Organiser")
                }
                .simultaneousGesture(TapGesture().onEnded{
                    viewModel.signInAsOrganizer()
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
