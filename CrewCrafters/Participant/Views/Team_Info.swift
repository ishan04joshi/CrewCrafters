//
//  Team_info.swift
//  CrewCrafters
//
//  Created by user1 on 09/12/23.
//

import SwiftUI

struct Team_info: View {
    @EnvironmentObject var teamViewModel: TeamsViewModel
    @EnvironmentObject var profileViewModel:ProfileViewModel
    @EnvironmentObject var userViewModel:UserViewModel
    @EnvironmentObject var hackathonViewModel:HackathonViewModel
    @EnvironmentObject var applyViewModel: ApplyViewModel
    @State var showingDetail = false
    let teamIndex: Int
    let hid:String
    var body: some View {
        let team = teamViewModel.teams[teamIndex]
        var teamId = teamViewModel.teams[teamIndex].id
        ScrollView{
            VStack(alignment: .leading){
                Image(uiImage: team.teamphoto ?? UIImage(named: "team_poster")!)
                    .resizable()
                    .frame(width: 375.0, height: 195.0)
                    .cornerRadius(20.0)
                
                HStack
                {
                    Text("Themes: ")
                        .fontWeight(.semibold)
                    Text(team.theme)
                }
                .font(.title3)
                
                VStack(alignment: .leading){
                    Text("Problem Statement:").font(.title3).fontWeight(.semibold)
                    Text(team.problem)
                }
                Spacer()
                
                Text("Team members:")
                    .font(.title3)
                    .fontWeight(.bold)
            }
            HStack {
                VStack {
                    Spacer()
                    Image(uiImage: profileViewModel.anyProfile.profilephoto ?? UIImage(named: "bg")!)
                        .resizable(resizingMode: .stretch)
                        .frame(width: 65.0, height: 65.0)
                    Spacer()
                }.frame(width: 80.0)
                VStack(alignment: .leading) {
                    Text(profileViewModel.anyProfile.name)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                    Text(profileViewModel.anyProfile.techstack[0])
                        .font(.subheadline)
                }
                Spacer()
                Spacer()
                ZStack {
                    Text("Admin")
                        .font(.title2)
                        .padding(.trailing, 10.0)
                        .fontWeight(.bold)
                        .foregroundColor(Color.green)
                }
            }.padding(.all, 10.0)
            if(teamViewModel.teams[teamIndex].admin_id==userViewModel.userId){
                
                ForEach(0..<team.member_count) { index in
                    HStack{
                        if let applicationWithStatus1 = applyViewModel.applications.first(where: { $0.tech_stack == team.tech_stack[index] && $0.status == 1 }) {
                            var uid=applicationWithStatus1.userId
                            HStack{
                                VStack{
                                    Spacer()
                                    Image(uiImage: profileViewModel.manyProfile.profilephoto ?? UIImage(named: "bg")!)
                                        .resizable(resizingMode: .stretch)
                                        .frame(width: 65.0, height: 65.0)
                                    Spacer()
                                }.frame(width: 80.0)
                                VStack(alignment: .leading){
                                    Text(profileViewModel.manyProfile.name)
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.leading)
                                    Text(team.tech_stack[index])
                                        .font(.subheadline)
                                }
                            }.onAppear{profileViewModel.fetchmanyProfile(userId: uid) { fetchedProfile in
                                if let fetchedProfile = fetchedProfile {
                                    // Update the profile photo view once the profile is fetched
                                    DispatchQueue.main.async {
                                        profileViewModel.manyProfile = fetchedProfile
                                    }
                                }
                            }
                                
                            }
                            Spacer()
                            Spacer()
                            ZStack{
                                Button(action: {print("")}){
                                    Text("Filled").foregroundColor(.blue)
                                    
                                }.buttonStyle(.bordered)
                                    .tint(.green)
                            }
                        }
                        else{
                            VStack{
                                Spacer()
                                Image(systemName: "person.crop.circle")
                                    .resizable(resizingMode: .stretch)
                                    .frame(width: 65.0, height: 65.0)
                                Spacer()
                            }.frame(width: 80.0)
                            
                            VStack(alignment: .leading){
                                Text("Position \(index+1):")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.leading)
                                Text(team.tech_stack[index])
                                    .font(.subheadline)
                            }
                            Spacer()
                            Spacer()
                            ZStack{
                                Button(action: {print("")}){
                                    NavigationLink(destination: Applications(tech_stack: team.tech_stack[index],hackathonId:hid,teamid:teamId)){
                                        Text("Applications")
                                            .foregroundColor(.blue)
                                    }
                                }.buttonStyle(.bordered)
                                    .tint(.blue)
                            }
                        }
                            
                        }.padding(.all, 10.0)
                        
                        Divider()
                    
                }
            }
            else{
                ForEach(0..<team.member_count) { index in
                    HStack{
                        
                        VStack{
                            Spacer()
                            Image(systemName: "person.crop.circle")
                                .resizable(resizingMode: .stretch)
                                .frame(width: 65.0, height: 65.0)
                            Spacer()
                        }.frame(width: 80.0)
                        
                        VStack(alignment: .leading){
                            Text("Position \(index+1):")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.leading)
                            Text(team.tech_stack[index])
                                .font(.subheadline)
                            
                        }
                        Spacer()
                        Spacer()
                        ZStack{
                            Button(action: {print("")}){
                                NavigationLink(destination: Apply_form(tech_stack: team.tech_stack[index],hackathonId:hid,teamid:teamId)){
                                    Text("Apply Now")
                                        .foregroundColor(.blue)
                                }
                            }.buttonStyle(.bordered)
                                .tint(.blue)
                        }
                        
                    }.padding(.all, 10.0)
                    Divider()
                }
                
            }
            
            Spacer()
            
        }.navigationTitle(team.name).padding(.all, 10).onAppear {
            // Call fetchanyProfile when the view appears
            profileViewModel.fetchanyProfile(userId: teamViewModel.teams[teamIndex].admin_id)
        }
    }
}

//#Preview {
//    Team_info(name: "Amaze Team", image: "hackathon_poster1")
//}
