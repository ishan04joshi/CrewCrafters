//
//  HackathonViewModel.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 26/01/24.
//

import Foundation
import SwiftUI

class HackathonViewModel: ObservableObject {
    @Published var hackathons: [Hackathon] = []
    let defaultPoster = UIImage(named: "default_hackathon_poster")!
    let poster1 = UIImage(named: "hackathon_poster")!
    let partner1 = UIImage(named: "partner1")!
    let partner2 = UIImage(named: "partner2")!
    let partner3 = UIImage(named: "partner3")!
    
    init() {
        self.hackathons = [
            Hackathon(
                hackathonPoster: poster1,
                name: "Hackathon 1",
                about: "Lorem Ispum Dolor",
                mode: "Online",
                problem_count: 1,
                problemStatements: [ProblemStatementInfo(problem: "", description: "")],
                themes: ["Artificial Intelligence","Natural Language Processing"],
                startDate: Date.now,
                endDate: Date.now.addingTimeInterval(86400),
                partners: [partner1,partner2,partner3],
                prize1: "7000",
                prize2: "6000",
                prize3: "5000",
                isApproved: false
            ),
            Hackathon(
                hackathonPoster: defaultPoster,
                name: "ocean hack",
                about: "",
                mode: "Offline",
                problem_count: 2,
                problemStatements: [
                    ProblemStatementInfo(problem: "", description: ""),
                    ProblemStatementInfo(problem: "", description: "")
                ],
                themes: [],
                startDate: Date.now,
                endDate: Date.now,
                partners: [],
                prize1: "",
                prize2: "",
                prize3: "",
                isApproved: true
            ),
            Hackathon(
                hackathonPoster: defaultPoster,
                name: "SIH",
                about: "",
                mode: "Offline",
                problem_count: 2,
                problemStatements: [
                    ProblemStatementInfo(problem: "", description: ""),
                    ProblemStatementInfo(problem: "", description: "")
                ],
                themes: [],
                startDate: Date.now,
                endDate: Date.now,
                partners: [],
                prize1: "",
                prize2: "",
                prize3: "",
                isApproved: true
            )
        ]
    }
    
    @Published var currentHackathon: Hackathon = Hackathon(
        hackathonPoster: nil,
        name: "",
        about: "",
        mode: "",
        problem_count: 1,
        problemStatements: [ProblemStatementInfo(problem: "", description: "")],
        themes: [],
        startDate: Date.now,
        endDate: Date.now,
        partners: [],
        prize1: "",
        prize2: "",
        prize3: "",
        isApproved: false
    )
    
    func addNewHackathon(_ hackathon: Hackathon) {
        hackathons.append(hackathon)
    }
    
    func filteredHackathons(for userRole: UserRole) -> [Hackathon] {
        switch userRole {
        case .organizer:
            return hackathons
        case .participant:
            return hackathons.filter { $0.isApproved }
        }
    }
}
