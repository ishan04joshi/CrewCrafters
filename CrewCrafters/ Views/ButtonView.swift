//
//  ButtonView.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 26/12/23.
//

import SwiftUI
import AuthenticationServices
import GoogleSignIn
import GoogleSignInSwift

struct SignInWithAppleButtonView: View {
    var body: some View {
        SignInWithAppleButton(
            onRequest: { request in
                request.requestedScopes = [.fullName, .email]
            },
            onCompletion: { result in
                switch result {
                case .success(let authResult):
                    print("Successfully authenticated with Apple ID: \(authResult.credential)")
                case .failure(let error):
                    print("Failed to authenticate with Apple ID. Error: \(error.localizedDescription)")
                }
            }
        )
        .signInWithAppleButtonStyle(.white)
        .frame(width: 200, height: 45)
        .shadow(radius: 2, x: 2, y: 2)
    }
}

struct GoogleSignInButtonView: View {
    var body: some View {
        GoogleSignInButton(style: .wide, action: handleSignInButton)
            .frame(width: 200, height: 45)
    }
}

func handleSignInButton() {
  
}

#Preview {
    SignInWithAppleButtonView()
    //GoogleSignInButtonView()
}
