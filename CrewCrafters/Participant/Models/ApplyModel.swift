
import Foundation
import SwiftUI


struct ApplyModel: Identifiable,Equatable, Codable{
    
    static func == (lhs: ApplyModel, rhs: ApplyModel) -> Bool {
        return lhs.id == rhs.id
    }
    var id: String
    var name: String
    var email: String
    var phone: String
    var shareProfile: Bool
    var githubLink: String
    var suitability: String
    var achievements: String
    var status:Int //0-pending , -1 rejected , 1 aprroved
    var userId:String
}
