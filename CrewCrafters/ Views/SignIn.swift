//
//  SignIn.swift
//  CrewCrafters
//
//  Created by user1 on 25/12/23.
//

import SwiftUI

struct SignIn: View {
    @State private var email: String = ""
    var body: some View {
        ZStack {
            
            VStack {
                Spacer()
                
                VStack {
                    Text("Sign In")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 30)
                    
                    SignInWithAppleButtonView()
                    
                    //GoogleSignInButtonView()
                    
                    SocialLoginButton(image: Image(uiImage: #imageLiteral(resourceName: "google")), text: Text("Sign in with Google"))
                    
                    Text("or get a link emailed to you")
                        .font(.subheadline)
                        .foregroundColor(Color.black.opacity(0.3))
                    
                    TextField("Work email address", text: $email)
                        .font(.title3)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(50.0)
                        .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                        .padding(.vertical)
                    
                    PrimaryButton(title: "Email me a signup link")
                    
                }
                
                Spacer()
                Divider()
                Spacer()
                Text("You are completely safe.")
                Text("Read our Terms & Conditions.")
                    .foregroundColor(Color.blue)
                Spacer()
                Button(action: goHome){
                    Text("Go to Home")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.blue)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(50.0)
                        .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                    .padding(.vertical)}
                
                Spacer()
            }
            .padding()
        }
    }
}


struct SocialLoginButton: View {
    var image: Image
    var text: Text
    
    var body: some View {
        HStack {
            image
            text.fontWeight(.semibold)
        }
        .frame(width: 200, height: 45)
        .background(Color.white)
        .cornerRadius(5)
        .shadow(color: Color.black.opacity(0.3), radius: 2, x: 3, y: 3)
    }
}

#Preview {
    SignIn()
}
