//
//  OnboardingViewModel.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 17/01/24.
//

import Foundation

enum UserRole {
    case participant
    case organizer
}

struct User {
    var role: UserRole
}

class OnboardingViewModel: ObservableObject {
    @Published var currentUser: User
    @Published var isSignupComplete: Bool = false
    
    init() {
        self.currentUser = User(role: .participant)
    }
    
    func signInAsParticipant() {
        currentUser = User(role: .participant)
    }
    
    func signInAsOrganizer() {
        currentUser = User(role: .organizer)
    }
}
