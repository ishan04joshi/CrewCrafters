//
//  OrganiserCreateViewModel.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 15/01/24.
//

import Foundation

class OrganiserCreateHackViewModel: ObservableObject {
    @Published var hackathonInfo: OrganiserCreateHack
    
    init() {
        self.hackathonInfo = OrganiserCreateHack(
            hackathonPoster: nil,
            name: "",
            mode: "",
            problem_count: 0,
            problemStatements: Array(repeating: ProblemStatementInfo(problem: "", description: "", theme: ""), count: 1),
            selectedStartDate: Date.now,
            selectedEndDate: Date.now,
            prize1: "",
            prize2: "",
            prize3: ""
        )
    }
}
