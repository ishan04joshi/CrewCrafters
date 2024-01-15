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
        // Update if needed
    }
}

struct SignIn: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var showPrivacyPolicy = false
    
    var body: some View {
        VStack {
            
            Text("Sign In")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            TextField("Email Address", text: $email)
                .textFieldStyle(CustomTextFieldStyle())
                .padding(.bottom)
            
            ZStack(alignment: .trailingFirstTextBaseline) {
                if isPasswordVisible {
                    TextField("Password", text: $password)
                        .textFieldStyle(CustomTextFieldStyle())
                } else {
                    SecureField("Password", text: $password)
                        .textFieldStyle(CustomTextFieldStyle())
                }
                
                Button(action: {
                    isPasswordVisible.toggle()
                    if isPasswordVisible {
                        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
                            isPasswordVisible = false
                        }
                    }
                }) {
                    Image(systemName: "eye")
                        .padding(.trailing, 10)
                        .foregroundColor(Color.gray)
                }
                .padding(.trailing, 20)
            }
            
            HStack(spacing: 0) {
                Button(action: {}) {
                    Text("Forgot Password?")
                        .font(.subheadline)
                        .padding(.horizontal)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            .padding(.bottom)
            
            NavigationLink(
                destination: MainTabView().navigationBarHidden(true),
                label: {
                    Text("Sign In")
                })
            .buttonStyle(NavigationButton())
            .navigationBarHidden(true)
            
            
            
            HStack(spacing: 0) {
                Text("Already have an account? ")
                NavigationLink("Log in", destination: Login().navigationBarHidden(true))
                    .foregroundColor(Color.blue)
            }
            
            Text("or")
                .font(.subheadline)
                .padding(.vertical)
                .foregroundColor(Color.black.opacity(0.3))
            
            
            //SignInWithAppleButtonView()
            
            //GoogleSignInButtonView()
            
            HStack{
                Image(uiImage: #imageLiteral(resourceName: "apple"))
                    .padding()
                
                Image(uiImage: #imageLiteral(resourceName: "google"))
                    .padding()
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

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .font(.headline)
            .frame(height: 25)
            .padding()
            .background(Color.black.opacity(0.04))
            .cornerRadius(50)
    }
}

#Preview {
    SignIn()
}
