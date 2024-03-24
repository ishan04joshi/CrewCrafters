import SwiftUI

struct Profile_Create: View {
    
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @State private var isImagePickerP = false
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Profile Data")) {
                    // CameraButton
                    HStack {
                        Spacer()
                        Button(action: {
                            isImagePickerP.toggle()
                        }) {
                            if let profilephoto = profileViewModel.currentProfile.profilephoto {
                                Image(uiImage: profilephoto)
                                    .resizable()
                                    .clipShape(Circle())
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                            } else {
                                Circle()
                                    .fill(Color(hue: 1.0, saturation: 0.0, brightness: 0.867))
                                    .frame(width: 155)
                                    .overlay(
                                        Image(systemName: "camera.fill")
                                            .resizable()
                                            .frame(width: 50, height: 40)
                                            .foregroundStyle(Color.black)
                                    )
                            }
                        }
                        .sheet(isPresented: $isImagePickerP) {
                            ImagePicker(image: $profileViewModel.currentProfile.profilephoto, defaultPoster: profileViewModel.defaultphoto)
                        }
                        Spacer()
                    }
                    .padding(.top, 30)
                    .padding(.bottom, 30)
                    
                    HStack {
                        Text("Name: ")
                        TextField("Name", text: $profileViewModel.currentProfile.name)
                    }
                    .padding(.bottom, 15.0)
                    
                    HStack {
                        Text("Bio: ")
                        TextField("Your Bio", text: $profileViewModel.currentProfile.bio)
                    }
                    .padding(.bottom, 15.0)
                    
                    HStack {
                        Text("About: ")
                        TextField("Express About Yourself", text: $profileViewModel.currentProfile.about)
                    }
                    .padding(.bottom, 15.0)
                    
                    VStack(alignment: .leading) {
                        Text("Tech Stack: ")
                        Divider()
                        TextField("Tech Stack 1", text: $profileViewModel.currentProfile.techstack[0])
                        Divider()
                        TextField("Tech Stack 2", text: $profileViewModel.currentProfile.techstack[1])
                        Divider()
                        TextField("Tech Stack 3", text: $profileViewModel.currentProfile.techstack[2])
                        Divider()
                        TextField("Tech Stack 4", text: $profileViewModel.currentProfile.techstack[3])
                        Divider()
                    }
                    .padding(.bottom, 15.0)
                    
                }
            }
            
            Button(action: {
                // Add action to be performed on submit
                userViewModel.userRole = userViewModel.role
                profileViewModel.addNewProfile(profileViewModel.currentProfile, userId: userViewModel.userId) {
                    // Add any completion code here
                }
                userViewModel.currentUser = true
            }) {
                Text("Get Started")
            }
            .buttonStyle(NavigationButton())
            .navigationBarBackButtonHidden()
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Create Your Profile")
        .padding(.horizontal, 7)
        .onAppear {
            print("hello")
        }
    }
}
