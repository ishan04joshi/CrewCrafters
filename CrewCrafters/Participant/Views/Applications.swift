//
//  Applications.swift
//  CrewCrafters
//
//  Created by user35 on 04/03/24.
//

//
//  Hack_Teams.swift
//  CrewCrafters
//
//  Created by user1 on 09/12/23.
//

import SwiftUI

struct Applications: View {
    let tech_stack: String
    let hackathonId: String
    let teamid: String
    @EnvironmentObject var hackathonViewModel: HackathonViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var applyViewModel: ApplyViewModel // Changed variable name to follow Swift conventions
    
    var body: some View {
        VStack(spacing: 0){
            ScrollView {
                ForEach(applyViewModel.applications.filter { $0.status == 0 }) { application in
                    NavigationLink(destination: ApplicationDetail(applicationIndex: applyViewModel.applications.firstIndex(of: application) ?? 0,tech_stack: tech_stack,hackathonId: hackathonId, teamId: teamid )) {
                        ApplicationItemView(application: application)
                    }
                    .buttonStyle(PlainButtonStyle())
                    Divider()
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle("Applicants")
        .onAppear {
            applyViewModel.fetchApplication(hackathonId: hackathonId, teamId: teamid, tech_stack: tech_stack)
        }
    }
}

struct ApplicationItemView: View {
    @EnvironmentObject var profileViewModel:ProfileViewModel
    let application: ApplyModel
    
    var body: some View {
        HStack {
            
            VStack{
                Spacer()
                Image(uiImage: profileViewModel.anyProfile.profilephoto ?? UIImage(named: "team_poster")!)
                    .resizable(resizingMode: .stretch)
                    .frame(width: 85.0, height: 85.0)
                Spacer()
            }
            Spacer()
            VStack(alignment: .leading){
                Text(profileViewModel.anyProfile.name)
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                
                ForEach(profileViewModel.anyProfile.techstack, id: \.self) { tech in
                    Text(tech)
                        .foregroundColor(.black)
                }
            }
            Spacer()
            Spacer()
            
        }.padding(.all, 10.0).onAppear{
            profileViewModel.fetchanyProfile(userId: application.userId)
        }
    }
}

//struct HackLand_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            Hack_Teams(hackathonIndex: 0)
//        }
//        .environmentObject(HackathonViewModel())
//    }
//}
