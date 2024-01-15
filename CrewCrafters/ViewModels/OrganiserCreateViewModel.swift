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
            theme_count: 0,
            selectedStartDate: Date.now,
            selectedEndDate: Date.now,
            prize1: "",
            prize2: "",
            prize3: "",
            problemStatement: Array(repeating: ProblemStatementInfo(problem: "", description: "", theme: ""), count: 1)
        )
    }
}
