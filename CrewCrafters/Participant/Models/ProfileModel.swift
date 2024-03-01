//
//  ProfileModel.swift
//  CrewCrafters
//
//  Created by user35 on 01/03/24.
//

import Foundation
import SwiftUI


struct ProfileM: Identifiable, Equatable , Decodable{
    static func == (lhs: ProfileM, rhs: ProfileM) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id : String = ""
    var coverphotoData: Data?
    var profilephotoData: Data?
    var name: String
    var bio: String
    var techstack: [String]
    var achievementsData: [Data]
    var about: String
    
    var coverphoto: UIImage? {
        get {
            guard let data = coverphotoData else { return nil }
            return UIImage(data: data)
        }
        set {
            coverphotoData = newValue?.jpegData(compressionQuality: 0.1)
        }
    }
    var profilephoto: UIImage? {
        get {
            guard let data = profilephotoData else { return nil }
            return UIImage(data: data)
        }
        set {
            profilephotoData = newValue?.jpegData(compressionQuality: 0.1)
        }
    }
    
    var achievements: [UIImage] {
        get {
            return achievementsData.compactMap { UIImage(data: $0) }
        }
        set {
            achievementsData = newValue.compactMap { $0.jpegData(compressionQuality: 0.1) }
        }
    }
    
}
