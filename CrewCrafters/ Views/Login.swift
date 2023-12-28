//
//  Login.swift
//  CrewCrafters
//
//  Created by user1 on 25/12/23.
//

import SwiftUI

struct Login: View {
    var body: some View {
            NavigationView {
                ZStack {
                    Color("BgColor").edgesIgnoringSafeArea(.all)
                    VStack {
                        Spacer()
                        Image("CrewCrafter").resizable()
                            .frame(width: 250, height: 250)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(15)
                        Spacer()
                        PrimaryButton(title: "Get Started")
                        NavigationLink(
                            destination: SignIn().navigationBarHidden(true),
                            label: {
                                Text("Log In")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.blue)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.black.opacity(0.1))
                                    .cornerRadius(50.0)
                                    .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                                    .padding(.vertical)
                            })
                            .navigationBarHidden(true)
                        
                        HStack {
                            Text("New around here? ")
                            Text("Sign in")
                                .foregroundColor(Color.blue)
                        }
                    }
                    .padding()
                }
            }
        }
}

#Preview {
    Login()
}
