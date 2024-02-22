//
//  Organizer_Create.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 14/01/24.
//

import SwiftUI

struct Organizer_Create: View {
    @EnvironmentObject var hackathonViewModel: HackathonViewModel
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Hackathon Information")) {
                    CameraButton(image: $hackathonViewModel.currentHackathon.hackathonPoster)
                        .padding(.top, 20)
                        .padding(.bottom, 20)
                    
                    HStack {
                        Text("Hackathon Name: ")
                        TextField("Name", text: $hackathonViewModel.currentHackathon.name)
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
                        Text("No. Problems:")
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
                                Text("Problem Statement: \(index + 1)")
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
                            Text("\(index + 1) Position: ")
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
            .contentMargins(.horizontal, 5)
            
            NavigationLink(destination: Organizer_Home()) {
                Text("Publish Hackathon")
            }
            .buttonStyle(NavigationButton())
            .padding()
            .simultaneousGesture(TapGesture().onEnded {
                hackathonViewModel.addNewHackathon(hackathonViewModel.currentHackathon)
            })
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Create Hackathon")
        .padding(.horizontal, 7)
    }
}

//struct Organizer_Create_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            Organizer_Create()
//        }
//        .environmentObject(HackathonViewModel()) // Make sure to provide the environment object
//    }
//}
