//
//  OnboardingViewModel.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 17/01/24.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

class UserViewModel: ObservableObject {
    @Published var userRole: String = ""
    @Published var userId: String = ""
    @Published var role: String = ""
}
