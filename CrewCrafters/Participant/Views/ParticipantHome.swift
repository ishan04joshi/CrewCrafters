//
//  Home.swift
//  CrewCrafters
//
//  Created by user1 on 09/12/23.
//

import SwiftUI

struct ParticipantHome: View {
    @EnvironmentObject var profileViewModel:ProfileViewModel
    @EnvironmentObject var userViewModel:UserViewModel
    @EnvironmentObject var teamViewModel: TeamsViewModel
    @EnvironmentObject var hackathonViewModel: HackathonViewModel
    
    var body: some View {
        let hackathonId = "031pO28CxUynwuMHXzeL"
        NavigationView {
            
            ScrollView {
                VStack {
                    HStack {
                        NavigationLink(destination: Profile()) {
                            Image(uiImage: profileViewModel.currentProfile.profilephoto ?? UIImage(named: "user")!)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80)
                                .clipShape(Circle())
                                .padding(.leading,25)
                        }
                        VStack(alignment: .leading){
                            Text("Hey").font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.gray)
                            Text(" \(profileViewModel.currentProfile.name)!")
                                .font(.title2)
                                .fontWeight(.semibold)
                        }.padding()
                        
                        Spacer()
                        ZStack
                        {
                            Circle()
                                    .foregroundColor(Color.gray.opacity(0.5))
                                    .frame(width: 36,height: 35)
                                    .padding(.trailing, 2)
                            Button(action: {}){
                                NavigationLink(destination: Notification()){
                                    Image(systemName: "bell.fill").resizable()
                                        .frame(width: 23,height: 23).foregroundColor(Color.blue)
                                    
                                }
                            }
                        }.padding(.trailing,25)
                        
                    }
                    .padding(.bottom, 20)
    
                    
                    ScrollView(.horizontal) {
                        HStack{
                            ForEach(teamViewModel.teams){ team in
                                NavigationLink(destination: Team_info(teamIndex: teamViewModel.teams.firstIndex(of: team) ?? 0,hid:hackathonId)) {
                                    TeamItemHomeView(team: team)
                                }
                                .buttonStyle(PlainButtonStyle())
                                .padding(.bottom)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .onAppear {
                        teamViewModel.fetchTeams(hackathonId: hackathonId)
                    }

                    Text("Upcoming Hackathons")
                        .font(.title)
                        .titleStyle()
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(hackathonViewModel.hackathons) { hackathon in
                                NavigationLink(destination: Hack_Land(hackathonIndex: hackathonViewModel.hackathons.firstIndex(of: hackathon) ?? 0)) {
                                    ParticipantHomeHackathonView(hackathon: hackathon)
                                }
                                .buttonStyle(PlainButtonStyle())
                                .padding(.bottom)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .onAppear {
                        hackathonViewModel.fetchHackathons()
                    }
                                        
                    
                    Text("Applied Hackathon")
                        .font(.title)
                        .titleStyle()
                    
                    ForEach(0..<2){_ in
                        VStack(alignment: .leading, spacing: 16) {
                           
                            if let firstHackathon = hackathonViewModel.hackathons.first {
                                NavigationLink(destination: Hack_Land(hackathonIndex: hackathonViewModel.hackathons.firstIndex(of: firstHackathon) ?? 0)) {
                                    ParticipantAppliedHomeHackathonView(hackathon: firstHackathon)
                                        .padding(.bottom)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)

                    }
                    .padding([.leading, .bottom, .trailing])
                }.onAppear(){
                    profileViewModel.fetchProfile(userId: userViewModel.userId)
                }
            }.background(Color.black)
                .foregroundColor(Color.white)
        }
    }
}



//down are view structures


struct ParticipantHomeHackathonView: View {
    let hackathon: Hackathon
    
    var body: some View {
        ZStack(alignment: .bottomLeading){
            Image(uiImage: hackathon.hackathonPoster ?? UIImage(named: "default_hackathon_poster")!)
                .resizable()
                .frame(width: 250, height: 150)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(15)
                .overlay(
                    LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                        .frame(width: 250.0, height: 150.0)
                        .clipShape(
                            .rect(
                                topLeadingRadius: 10,
                                bottomLeadingRadius: 8,
                                bottomTrailingRadius: 8,
                                topTrailingRadius: 10
                            )
                        )
                        .padding(.bottom, 0)
                )
            Text(hackathon.name)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 0))
        }
    }
}
struct TeamItemHomeView: View {
    let team: Teams
    
    var body: some View {
        VStack {
            
            VStack{
                Image(uiImage: team.teamphoto ?? UIImage(named: "team_poster")!)
                    .resizable(resizingMode: .stretch)
                    .clipShape(Circle())
                    .frame(width: 65.0, height: 65.0)
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 3, y: 3)
            }
            Spacer()
            VStack(alignment: .leading){
                Text(team.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
               
            }
        }.padding(.all, 10.0)
    }
}
struct ParticipantAppliedHomeHackathonView: View {
    let hackathon: Hackathon
    @EnvironmentObject var teamViewModel: TeamsViewModel
    @EnvironmentObject var hackathonViewModel: HackathonViewModel
    @State private var teamCount: Int = 0
    @State private var teamPosters: [UIImage] = []
    var body: some View {
    VStack(alignment: .leading, spacing: 7)  {
        HStack{
            Text(hackathon.name)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                
            Spacer()
            VStack {
                HStack(spacing: -10) {
                    if !teamPosters.isEmpty {
                        ForEach(teamPosters.prefix(3), id: \.self) { poster in
                            Image(uiImage: poster)
                                .resizable()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                        }
                    }
                }
                .onAppear {
                    teamViewModel.fetchTeamPosters(for: hackathon.id) { posters in
                        teamPosters = posters
                    }
                }
                Text("+ \(teamCount)00")
                    .font(.caption)
                    .onAppear {
                        teamViewModel.fetchTeamCount(for: hackathon.id) { count in
                            teamCount = count
                        }
                    }.padding(.leading,25)
            }
        }.padding()
        
        VStack(alignment: .leading){
            Text("Themes")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                
            Text("No Restriction")
                .font(.callout)
                .fontWeight(.bold)
                .foregroundColor(.gray)
                
        }.padding(.horizontal)
        
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "calendar")
                        .font(.caption)
                    Text("\(formatDate(from: hackathon.startDate)) - \(formatDate(from: hackathon.endDate))")
                        .font(.callout)
                }
                HStack {
                    Image(systemName: "location.fill")
                        .font(.callout)
                    
                    Text("Chennai, India")
                        .font(.caption)
                }
                .foregroundStyle(Color.white)
            }
            
            Spacer()
            HStack{
                NavigationLink(destination: Hack_Land(hackathonIndex: hackathonViewModel.hackathons.firstIndex(of: hackathon) ?? 0)){
                    Text("More Info")
                        .foregroundColor(.white).padding(.all ,10)
                }.background(Color.blue.opacity(0.4))
                    .cornerRadius(8.0)
                
            }
        }
        .padding()
    }
    .background(Color.gray.opacity(0.4))
    .cornerRadius(15)
    .shadow(color: Color.blue.opacity(0.1), radius: 5, x: 3, y: 3)
    }
}


struct ParticipantHome_Previews: PreviewProvider {
    static var previews: some View {
        ParticipantHome()
            .environmentObject(ProfileViewModel())
            .environmentObject(UserViewModel())
            .environmentObject(TeamsViewModel())
            .environmentObject(HackathonViewModel())
    }
}
