//
//  SocialLoginButton.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 29/12/23.
//

import SwiftUI

struct SocialLoginButton: View {
    var image: Image
    var text: Text
    
    var body: some View {
        HStack {
            image
            text.fontWeight(.semibold)
        }
        .frame(width: 320, height: 45)
        .background(Color.white)
        .cornerRadius(5)
        .shadow(color: Color.black.opacity(0.3), radius: 2, x: 3, y: 3)
        .padding(.vertical, 20.0)
    }
}

#Preview {
    SocialLoginButton(image: Image(uiImage: #imageLiteral(resourceName: "google")), text: Text("Sign in with Google"))
        
}
