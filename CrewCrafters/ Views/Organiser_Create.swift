//
//  Organizer_Create.swift
//  CrewCrafters
//
//  Created by user1 on 14/01/24.
//

import SwiftUI

struct Organizer_Create: View {
    @StateObject private var viewModel = OrganiserCreateHackViewModel()
    var body: some View {
        
        VStack{
            
            Form {
                Section(header: Text("Hackathon Information")) {
                    HStack {
                        Spacer()
                        ZStack {
                            Circle()
                                .fill(Color(hue: 1.0, saturation: 0.0, brightness: 0.867))
                                .frame(width: 155)
                            
                            Image(systemName: "camera.fill")
                                .resizable()
                                .frame(width: 50, height: 40)
                        }
                        Spacer()
                    }
                    
                    HStack{
                        Text("Hackathon Name: ")
                        TextField("Name",text: $viewModel.hackathonInfo.name)
                    }
                    .padding(.bottom, 7.0)
                    
                    HStack{
                        Text("Mode :")
                        TextField("Online / Offline",text: $viewModel.hackathonInfo.mode)
                    }
                    .padding(.bottom, 7.0)
                }
                
                Section(header: Text("Problem Statements")) {
                    HStack {
                        Text("Problem Statements:")
                        Picker("", selection: $viewModel.hackathonInfo.theme_count) {
                            ForEach(1...6, id: \.self) { count in
                                Text("\(count)").tag(count)
                            }
                        }
                    }
                    .padding(.bottom, 7.0)
                    
                    ForEach(0..<max(1, viewModel.hackathonInfo.theme_count), id: \.self) { themeIndex in
                        VStack(alignment: .leading) {
                            ForEach(0..<max(1, viewModel.hackathonInfo.problemStatement.count), id: \.self) { problemIndex in
                                TextField("Problem Statement \(problemIndex+1)", text: $viewModel.hackathonInfo.problemStatement[problemIndex].problem)
                                TextField("Description", text: $viewModel.hackathonInfo.problemStatement[problemIndex].description)
                                TextField("Theme", text: $viewModel.hackathonInfo.problemStatement[problemIndex].theme)
                            }
                        }
                    }
                }
                
                Section(header: Text("Timeline")) {
                    HStack {
                        DatePicker("Start Date", selection: $viewModel.hackathonInfo.selectedStartDate,
                                   in: Date.now...,
                                   displayedComponents: [.date])
                    }
                    HStack {
                        DatePicker("End Date", selection: $viewModel.hackathonInfo.selectedEndDate,
                                   in: viewModel.hackathonInfo.selectedStartDate.addingTimeInterval(86400)...,
                                   displayedComponents: [.date])
                    }
                    .padding(.bottom, 7.0)
                }
                
                Section(header: Text("Prize details")) {
                    HStack{
                        Text("First Position: ")
                        TextField("Amount",text: $viewModel.hackathonInfo.prize1)
                    }
                    .padding(.bottom, 7.0)
                    
                    HStack{
                        Text("Second Position: ")
                        TextField("Amount",text: $viewModel.hackathonInfo.prize2)
                    }
                    .padding(.bottom, 7.0)
                    
                    HStack{
                        Text("Third Position: ")
                        TextField("Amount",text: $viewModel.hackathonInfo.prize3)
                    }
                    .padding(.bottom, 7.0)
                }
            }
            .contentMargins(.horizontal, 5)
            
            NavigationLink(destination: Hack_Land(title: "hi", image: "hackathon_poster")){
                Text("Publish Hackathon")}
            .buttonStyle(NavigationButton())
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Create Your Team")
        .padding(.all, 7)
    }
}

#Preview {
    Organizer_Create()
}
