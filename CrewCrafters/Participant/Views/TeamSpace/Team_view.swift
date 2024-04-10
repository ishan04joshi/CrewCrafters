//
//  Team_info.swift
//  CrewCrafters
//
//  Created by user1 on 09/12/23.
//

import SwiftUI

struct Team_view: View {
    @EnvironmentObject var teamViewModel: TeamsViewModel
    @EnvironmentObject var profileViewModel:ProfileViewModel
    @EnvironmentObject var userViewModel:UserViewModel
    @EnvironmentObject var hackathonViewModel:HackathonViewModel
    @State var showingDetail = false
    let teamIndex: Int
    let hid:String
    var body: some View {
        let team = teamViewModel.teams[teamIndex]
        var teamId = teamViewModel.teams[teamIndex].id
        ScrollView{
            Text("Team members:")
                .font(.title3)
                .fontWeight(.bold)
            
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
                        Text("Friend \(index+1):")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                        Text(team.tech_stack[index])
                            .font(.subheadline)
                        
                    }
                    Spacer()
                    
                }.padding(.all, 8.0)
                Divider()
                
            }
            ZStack{
                
                NavigationLink(destination: ChatView(teamIndex: teamIndex)) {
                    HStack {
                        Text("Group Chat")
                            .foregroundColor(.blue)
                        Spacer()
                        Image(systemName: "arrow.right")
                            .foregroundColor(.blue)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
                    
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
