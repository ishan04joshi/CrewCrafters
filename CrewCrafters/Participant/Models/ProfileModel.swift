//
//  ProfileModel.swift
//  CrewCrafters
//
//  Created by user35 on 01/03/24.
//

import Foundation
import SwiftUI


struct ProfileM: Equatable, Codable{
    var profilephotoData: Data?
    var name: String
    var bio: String
    var techstack: [String]
    var about: String
    
    var profilephoto: UIImage? {
        get {
            guard let data = profilephotoData else { return nil }
            return UIImage(data: data)
        }
        set {
            profilephotoData = newValue?.jpegData(compressionQuality: 0.1)
        }
    }
    
    
}
