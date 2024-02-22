//
//  Team_create.swift
//  CrewCrafters
//
//  Created by user1 on 09/12/23.
//

import SwiftUI

struct Team_create: View {
    @State var teamsViewModel = TeamsViewModel()
    @State var count = Int()
    var body: some View {
        
        
        VStack{
            
//            ZStack{
////                CameraButton(image: $viewModel.hackathons.hackathonPoster)
////                    .padding(.top, 20)
////                    .padding(.bottom, 20)
//            }
            Form {
                Section(header: Text("Team Information")
                ) {
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
                        Picker(" ", selection: $count) {
                            ForEach(1...6, id: \.self) { count in
                                Text("\(count)").tag(count - 1)
                            }
                            Text("Other").tag(6)
                        }
                        
                    }.padding(.bottom, 7.0)
                    ForEach(0..<count+1, id: \.self) { index in
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
            
            
            NavigationLink(destination: Team_info(name: teamsViewModel.currentTeam.name, image: "hackathon_poster")){
                Text("Publish Team")}
            .buttonStyle(NavigationButton())
            .padding().simultaneousGesture(TapGesture().onEnded {
                teamsViewModel.addNewTeam(teamsViewModel.currentTeam)
            })
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Create Your Team")
        .padding(.all, 7)
    }
}


#Preview {
    Team_create()
}
