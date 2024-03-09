//
//  Organizer_Create.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 14/01/24.
//

import SwiftUI

struct Organizer_Create: View {
    @EnvironmentObject var hackathonViewModel: HackathonViewModel
    @State private var isImagePickerPresented = false
    @State private var initialName = ""
    @State private var initialAbout = ""
    @State private var initialMode = ""
    @State private var initialProblemCount = 1
    @State private var initialStartDate = Date()
    @State private var initialEndDate = Date()
    @State private var initialPrizes: [String] = ["", "", ""]
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Hackathon Information")) {
                    HStack {
                        Spacer()
                        Button(action: {
                            isImagePickerPresented.toggle()
                        }) {
                            if let hackathonPoster = hackathonViewModel.currentHackathon.hackathonPoster {
                                Image(uiImage: hackathonPoster)
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
                            ImagePicker(image: $hackathonViewModel.currentHackathon.hackathonPoster, defaultPoster: hackathonViewModel.defaultPoster)
                        }
                        Spacer()
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    
                    HStack {
                        Text("Hackathon Name: ")
                        TextField("Name", text: $hackathonViewModel.currentHackathon.name)
                    }
                    .padding(.bottom, 7.0)
                    
                    HStack {
                        Text("About Hackathon: ")
                        TextField("About", text: $hackathonViewModel.currentHackathon.about)
                    }
                    .padding(.bottom, 7.0)
                    
                    HStack {
                        Text("Mode :")
                        TextField("Online / Offline", text: $hackathonViewModel.currentHackathon.mode)
                    }
                    .padding(.bottom, 7.0)
                }
                
                Section(header: Text("Problem Statements")) {
                    
                    HStack {
                        Text("No. of Problems:")
                        Picker("", selection: $hackathonViewModel.currentHackathon.problem_count) {
                            ForEach(1...6, id: \.self) { count in
                                Text("\(count)").tag(count)
                            }
                        }
                    }
                    .padding(.bottom, 5.0)
                    
                    ForEach(0..<hackathonViewModel.currentHackathon.problem_count, id: \.self) { index in
                        VStack {
                            HStack{
                                Text("Problem Statement \(index + 1): ")
                                Spacer()
                            }
                            TextField("Statement", text: Binding(
                                get: {
                                    if index < hackathonViewModel.currentHackathon.problemStatements.count{
                                        return hackathonViewModel.currentHackathon.problemStatements[index]
                                    } else {
                                        return ""
                                    }
                                },
                                set: { newValue in
                                    
                                    if index < hackathonViewModel.currentHackathon.problemStatements.count {
                                        hackathonViewModel.currentHackathon.problemStatements[index] = newValue
                                    } else {
                                        hackathonViewModel.currentHackathon.problemStatements.append(newValue)
                                    }
                                }
                            ))
                            
                        }
                        .padding(.bottom, 7.0)
                    }
                }
                
                Section(header: Text("Timeline")) {
                    HStack {
                        DatePicker("Start Date", selection: $hackathonViewModel.currentHackathon.startDate,
                                   in: Date()..., displayedComponents: [.date])
                    }
                    .padding(.vertical, 4)
                    
                    HStack {
                        DatePicker("End Date", selection: $hackathonViewModel.currentHackathon.endDate,
                                   in: hackathonViewModel.currentHackathon.startDate.addingTimeInterval(86400)...,
                                   displayedComponents: [.date])
                    }
                    .padding(.vertical, 4)
                }
                
                
                Section(header: Text("Prize details")) {
                    ForEach(0..<3, id: \.self) { index in
                        HStack {
                            Text("Position \(index + 1): ")
                            TextField("Amount", text: Binding(
                                get: {
                                    if index < hackathonViewModel.currentHackathon.prize.count {
                                        return hackathonViewModel.currentHackathon.prize[index]
                                    } else {
                                        return ""
                                    }
                                },
                                set: { newValue in
                                    
                                    if index < hackathonViewModel.currentHackathon.prize.count {
                                        hackathonViewModel.currentHackathon.prize[index] = newValue
                                    } else {
                                        hackathonViewModel.currentHackathon.prize.append(newValue)
                                    }
                                }
                            ))
                            
                        }
                        .padding(.bottom, 7.0)
                    }
                }
            }
            
            
            NavigationLink(destination: OrganiserTabView()) {
                Text("Publish Hackathon")
            }
            .buttonStyle(NavigationButton())
            .navigationBarBackButtonHidden()
            .padding()
            .simultaneousGesture(TapGesture().onEnded {
                hackathonViewModel.addNewHackathon(hackathonViewModel.currentHackathon) {}
            })
            .simultaneousGesture(TapGesture().onEnded {
                hackathonViewModel.addNewHackathon(hackathonViewModel.currentHackathon) {}
                hackathonViewModel.currentHackathon.name = initialName
                hackathonViewModel.currentHackathon.about = initialAbout
                hackathonViewModel.currentHackathon.mode = initialMode
                hackathonViewModel.currentHackathon.problem_count = initialProblemCount
                hackathonViewModel.currentHackathon.startDate = initialStartDate
                hackathonViewModel.currentHackathon.endDate = initialEndDate
                hackathonViewModel.currentHackathon.prize = initialPrizes
            })
        }
        
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Create Hackathon")
    }
}

//struct Organizer_Create_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            Organizer_Create()
//        }
//        .environmentObject(HackathonViewModel())
//    }
//}
