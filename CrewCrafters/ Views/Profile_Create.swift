//
//  Organizer_Create.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 14/01/24.
//

import SwiftUI

struct Profile_Create: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @State private var isImagePickerP = false
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Profile Data")) {
                    //CameraButton
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            isImagePickerP.toggle()
                        }) {
                            if let profilephoto = profileViewModel.currentProfile.profilephoto{
                                Image(uiImage: profilephoto)
                                    .resizable()
                                    .scaledToFit()
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
                    .padding(.top, 20)
                    .padding(.bottom, 20)

                    
                    HStack {
                        Text("Name: ")
                        TextField("Name", text: $profileViewModel.currentProfile.name)
                    }
                    .padding(.bottom, 7.0)
                    
                    HStack {
                        Text("Bio: ")
                        TextField("Bio", text: $profileViewModel.currentProfile.bio)
                    }
                    .padding(.bottom, 7.0)
                    
                    HStack {
                        Text("About :")
                        TextField("About", text: $profileViewModel.currentProfile.about)
                    }
                    .padding(.bottom, 7.0)
                    
                    
                    
                }
                
                
               
                
                
                
                
            }
           
            
            NavigationLink(destination: OrganiserTabView()) {
                Text("Publish Hackathon")
            }
            .buttonStyle(NavigationButton())
            .navigationBarBackButtonHidden()
            .padding()
            .simultaneousGesture(TapGesture().onEnded {
                profileViewModel.addNewProfile(profileViewModel.currentProfile, userId: "pJ38sosDC4e9TFcKx6qFk5IZwS12"){}
            })
            .simultaneousGesture(TapGesture().onEnded {

                        })
                    }
        
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Create Hackathon")
        .padding(.horizontal, 7)
    }
}

struct Profile_Create_Previews: PreviewProvider {
    static var previews: some View {
        Profile_Create()
    }
}
