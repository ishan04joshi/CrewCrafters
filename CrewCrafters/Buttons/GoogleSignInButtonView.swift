//
//  GoogleSignInButtonView.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 29/12/23.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct GoogleSignInButtonView: View {
    var body: some View {
        GoogleSignInButton(style: .wide, action: handleSignInButton)
            .frame(width: 320, height: 45)
    }
}

func handleSignInButton() {
    
}

#Preview {
    GoogleSignInButtonView()
}
