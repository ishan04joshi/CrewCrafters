//
//  SignIn.swift
//  CrewCrafters
//
//  Created by user1 on 25/12/23.
//

import SwiftUI
import SafariServices

struct SFSafariViewWrapper: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SFSafariViewWrapper>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SFSafariViewWrapper>) {
        // Update code here if needed
    }
}

struct SignIn: View {
    @State private var email: String = ""
    @State private var showPrivacyPolicy = false
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                VStack {
                    Text("Log In")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 30)
                    
                    SignInWithAppleButtonView()
                    
                    //GoogleSignInButtonView()
                    
                    SocialLoginButton(image: Image(uiImage: #imageLiteral(resourceName: "google")), text: Text("Sign in with Google"))
                        .padding(.vertical, 20.0)
                    
                    Text("or get a link emailed to you")
                        .font(.subheadline)
                        .padding(.vertical)
                        .foregroundColor(Color.black.opacity(0.3))
                    
                    TextField("Work email address", text: $email)
                        .font(.headline)
                        .frame(height: 42)
                        .padding()
                        .cornerRadius(50.0)
                    
                    PrimaryButton(title: "Email me a signup link")
                }
                Spacer()
                Text("By continuing, you agree to our")
                Button(action: {
                    showPrivacyPolicy.toggle()
                }) {
                    Text("Privacy Policy")
                }
                .fullScreenCover(isPresented: $showPrivacyPolicy, content: {
                    SFSafariViewWrapper(url: URL(string: "https://developer.apple.com/support/terms/apple-developer-program-license-agreement/")!)
                })
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
        .frame(width: 320, height: 45)
        .background(Color.white)
        .cornerRadius(5)
        .shadow(color: Color.black.opacity(0.3), radius: 2, x: 3, y: 3)
    }
}

#Preview {
    SignIn()
}
