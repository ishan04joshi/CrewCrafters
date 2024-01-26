//
//  Organizer_Create.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 14/01/24.
//

import SwiftUI

struct Organizer_Create: View {
    @StateObject private var viewModel = HackathonViewModel()

    var body: some View {
        VStack {
            Form {
                sectionHackathonInformation
                sectionProblemStatements
                sectionTimeline
                sectionPrizeDetails
            }
            .contentMargins(.horizontal, 5)

            NavigationLink(destination: Organizer_Home()) {
                Text("Publish Hackathon")
            }
            .buttonStyle(NavigationButton())
            .padding()
            .simultaneousGesture(TapGesture().onEnded {
                viewModel.addNewHackathon(viewModel.currentHackathon)
            })
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Create Hackathon")
        .padding(.horizontal, 7)
    }

    private var sectionHackathonInformation: some View {
        Section(header: Text("Hackathon Information")) {
            CameraButton(image: $viewModel.currentHackathon.hackathonPoster)
                .padding(.top, 20)
                .padding(.bottom, 20)

            HStack {
                Text("Hackathon Name: ")
                TextField("Name", text: $viewModel.currentHackathon.name)
            }
            .padding(.bottom, 7.0)

            HStack {
                Text("Mode :")
                TextField("Online / Offline", text: $viewModel.currentHackathon.mode)
            }
            .padding(.bottom, 7.0)
        }
    }

    private var sectionProblemStatements: some View {
        Section(header: Text("Problem Statements")) {
            HStack {
                Text("Problem Statements:")
                Picker("", selection: $viewModel.currentHackathon.problem_count) {
                    ForEach(1...6, id: \.self) { count in
                        Text("\(count)").tag(count)
                    }
                }
            }
            .padding(.bottom, 5.0)

            ForEach(0..<max(1, viewModel.currentHackathon.problem_count), id: \.self) { index in
                VStack(alignment: .leading) {
                    ForEach(0..<max(1, viewModel.currentHackathon.problemStatements.count), id: \.self) { problemIndex in
                        TextField("Problem Statement \(index + 1)", text: $viewModel.currentHackathon.problemStatements[problemIndex].problem)
                        TextField("Description", text: $viewModel.currentHackathon.problemStatements[problemIndex].description)
                    }
                }
            }
        }
    }

    private var sectionTimeline: some View {
        Section(header: Text("Timeline")) {
            HStack {
                DatePicker("Start Date", selection: $viewModel.currentHackathon.startDate,
                           in: Date()..., displayedComponents: [.date])
            }
            .padding(.vertical, 4)

            HStack {
                DatePicker("End Date", selection: $viewModel.currentHackathon.endDate,
                           in: viewModel.currentHackathon.startDate.addingTimeInterval(86400)...,
                           displayedComponents: [.date])
            }
            .padding(.vertical, 4)
        }
    }

    private var sectionPrizeDetails: some View {
        Section(header: Text("Prize details")) {
            HStack {
                Text("First Position: ")
                TextField("Amount", text: $viewModel.currentHackathon.prize1)
            }
            .padding(.bottom, 7.0)

            HStack {
                Text("Second Position: ")
                TextField("Amount", text: $viewModel.currentHackathon.prize2)
            }
            .padding(.bottom, 7.0)

            HStack {
                Text("Third Position: ")
                TextField("Amount", text: $viewModel.currentHackathon.prize3)
            }
            .padding(.bottom, 7.0)
        }
    }
}

#Preview {
    Organizer_Create()
}
