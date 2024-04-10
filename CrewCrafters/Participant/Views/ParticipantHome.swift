//
//  Home.swift
//  CrewCrafters
//
//  Created by user1 on 09/12/23.
//

import SwiftUI

struct ParticipantHome: View {
    let hackathonIndex: Int
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
                        Image(uiImage: profileViewModel.currentProfile.profilephoto ?? UIImage(named: "user")!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100)
                            .clipShape(Circle())
                            .padding(.leading,25)
                        VStack(alignment: .leading){
                            Text("Hey").font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.gray)
                            Text(" \(profileViewModel.currentProfile.name)!")
                                .font(.title2)
                                .fontWeight(.semibold)
                        }.padding()
                        
                        Spacer()
                        HStack
                        {
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
                            HStack(spacing: 12) {
                                Image(uiImage: profileViewModel.currentProfile.profilephoto ?? UIImage(named: "user")!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                                    .frame(width: 80)
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(profileViewModel.currentProfile.name)
                                        .fontWeight(.bold)
                                        .font(.title3)
                                    HStack(alignment: .center, spacing: 3) {
                                        
                                        Image(uiImage: UIImage(named: "team_poster")!)
                                            .resizable(resizingMode: .stretch)
                                            .frame(width: 30.0, height: 30.0)
                                            .shadow(color: Color.black.opacity(0.1), radius: 3, x: 2, y: 2)
                                        Text("Error 404")
                                            .fontWeight(.semibold)
                                    }.onAppear {
                                        teamViewModel.fetchTeams(hackathonId: hackathonId)
                                    }
                                    .foregroundStyle(Color.white.opacity(0.5))
                                }
                            }
                            .padding(8)
                            Text("Upcoming Deadline:")
                                .fontWeight(.semibold)
                                .padding(8)
                            HStack{
                                Text("Problem Statement Submission")
                                    .lineLimit(6)
                                    .padding(.leading, 8)
                                Spacer()
                                HStack {
                                    Image(systemName: "calendar")
                                        .font(.caption)
                                    Text("06 Mar 24")
                                        .font(.caption)
                                }.padding(6)
                            }
                            
                            HStack{
                                Text("Prototype Submission")
                                    .lineLimit(6)
                                    .padding(8)
                                Spacer()
                                HStack {
                                    Image(systemName: "calendar")
                                        .font(.caption)
                                    Text("10 Mar 24")
                                        .font(.caption)
                                }.padding(6)
                            }
                           
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
                        .shadow(color: Color.gray.opacity(0.2), radius: 3, x: 3, y: 5)

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
            if let posterURL = hackathon.posterURL {
                AsyncImage(url: URL(string: posterURL)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 250, height: 150)
                            .cornerRadius(15)
                            .overlay(
                                LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                                    .frame(width: 250.0, height: 150.0)
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 10)
                                    )
                                    .padding(.bottom, 0)
                            )
                    default:
                        ProgressView()
                    }
                }
            } else {
                Image(uiImage: UIImage(named: "default_hackathon_poster")!)
                    .resizable()
                    .frame(width: 250, height: 150)
                    .cornerRadius(15)
                    .overlay(
                        LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                            .frame(width: 250.0, height: 150.0)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 10)
                            )
                            .padding(.bottom, 0)
                    )
            }
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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 7)  {
            ZStack(alignment: .bottomLeading) {
                if let posterURL = hackathon.posterURL {
                    AsyncImage(url: URL(string: posterURL)) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 340.0, height: 200.0)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 10)
                                )
                                .overlay(
                                    LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                                        .frame(width: 340.0, height: 200.0)
                                        .clipShape(
                                            RoundedRectangle(cornerRadius: 10)
                                        )
                                        .padding(.bottom, 0)
                                )
                        default:
                            ProgressView()
                        }
                    }
                } else {
                    Image(uiImage: UIImage(named: "default_hackathon_poster")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 340.0, height: 200.0)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 10)
                        )
                        .overlay(
                            LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                                .frame(width: 340.0, height: 200.0)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 10)
                                )
                                .padding(.bottom, 0)
                        )
                }
                
                Text(hackathon.name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 0))
            }
            
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "calendar")
                            .font(.caption)
                        Text("\(formatDate(from: hackathon.startDate)) - \(formatDate(from: hackathon.endDate))")
                            .font(.caption)
                    }
                    HStack {
                        Image(systemName: "location.fill")
                            .font(.caption)
                        
                        Text("Chennai, India")
                            .font(.caption)
                    }
                    .foregroundStyle(Color.white)
                }
                .padding(.leading)
                
                Spacer()
            }
            .padding(.trailing)
        }
        .padding(.bottom)
        .background(Color.gray)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 3, y: 3)
        .padding(.horizontal)
    }
}



struct ParticipantHome_Previews: PreviewProvider {
    static var previews: some View {
        ParticipantHome(hackathonIndex: 0)
            .environmentObject(ProfileViewModel())
            .environmentObject(UserViewModel())
            .environmentObject(TeamsViewModel())
            .environmentObject(HackathonViewModel())
    }
}
