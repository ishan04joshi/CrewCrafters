//
//  Team_create.swift
//  CrewCrafters
//
//  Created by user1 on 09/12/23.
//

import SwiftUI

struct Team_create: View {
    let hackathonIndex: Int
    @EnvironmentObject var hackathonViewModel: HackathonViewModel
    @EnvironmentObject var teamsViewModel  : TeamsViewModel
    @State private var isImagePickerPresented = false
    @State var count = Int()
    var body: some View {
        
        
        VStack{

            Form {
                
                    
                Section(header: Text("Team Information")
                ) {
                    HStack {
                        Spacer()
                        Button(action: {
                            isImagePickerPresented.toggle()
                        }) {
                            if let teamphoto = teamsViewModel.currentTeam.teamphoto {
                                Image(uiImage: teamphoto)
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
                        .sheet(isPresented: $isImagePickerPresented) {
                            ImagePicker(image: $teamsViewModel.currentTeam.teamphoto, defaultPoster: teamsViewModel.defaultphoto)
                        }
                        Spacer()
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    
                    HStack{
                        Text("Team Name: ")
                        TextField("Name",text: $teamsViewModel.currentTeam.name)
                    }.padding(.bottom, 7.0)
                    
                    HStack{
                        Text("Theme: ")
                        TextField("Theme",text: $teamsViewModel.currentTeam.theme)
                    }.padding(.bottom, 7.0)
                    
                    HStack{
                        Text("Problem Statement: ")
                        TextField("Statement",text: $teamsViewModel.currentTeam.problem)
                    }.padding(.bottom, 7.0)
                    
                    
                    
                    
                }
                
                
                Section(header: Text("Members Information")) {
                    HStack{
                        Text("Member Count:")
                        Picker("Member Count:", selection: $count) {
                            ForEach(1...6, id: \.self) { count in
                                Text("\(count)").tag(count)
                            }
                            Text("Other").tag(7) // Assuming 7 represents "Other"
                        }
                        .onChange(of: count) { newValue in
                            teamsViewModel.currentTeam.member_count = newValue
                        }
                        
                        
                    }.padding(.bottom, 7.0)
                    
                    ForEach(0..<count, id: \.self) { index in
                        VStack {
                            HStack{
                                Text("Member: \(index + 1)")
                                Spacer()
                            }
                            TextField("Tech Stack", text: Binding(
                                get: {
                                    if index < teamsViewModel.currentTeam.tech_stack.count{
                                        return teamsViewModel.currentTeam.tech_stack[index]
                                    } else {
                                        return ""
                                    }
                                },
                                set: { newValue in
                                    
                                    if index < teamsViewModel.currentTeam.tech_stack.count {
                                        teamsViewModel.currentTeam.tech_stack[index] = newValue
                                    } else {
                                        teamsViewModel.currentTeam.tech_stack.append(newValue)
                                    }
                                }
                                
                            ))
                            
                        }
                        .padding(.bottom, 7.0)
                    }
                                }
                
                
            }.contentMargins(.horizontal, 5)
            
            
            NavigationLink(destination: Search()){
                Text("Publish Team")}
            .buttonStyle(NavigationButton())
            .padding().simultaneousGesture(TapGesture().onEnded {
                teamsViewModel.addNewTeam(teamsViewModel.currentTeam, hackathonId: hackathonViewModel.hackathons[hackathonIndex].id)
            })
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Create Your Team")
        .padding(.all, 7)
    }
}


