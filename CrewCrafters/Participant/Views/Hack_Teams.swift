//
//  Hack_Teams.swift
//  CrewCrafters
//
//  Created by user1 on 09/12/23.
//

import SwiftUI

struct Hack_Teams: View {
    let hackathonIndex: Int
    @EnvironmentObject var hackathonViewModel: HackathonViewModel
    @EnvironmentObject var teamViewModel: TeamsViewModel
    @State private var searchText = ""
    
    var body: some View {
        var hackathonId = hackathonViewModel.hackathons[hackathonIndex].id
        
        VStack(spacing: 0){
            HStack {
                TextField("Teams", text: $searchText)
                    .padding(8)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.bottom, 8)
            }
            .padding(.horizontal)
            
            ScrollView {
                ForEach(teamViewModel.teams.filter {
                    searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText)
                }) { team in
                    NavigationLink(destination: Team_info(teamIndex: teamViewModel.teams.firstIndex(of: team) ?? 0)) {
                        TeamItemView(team: team)
                    }
                    .buttonStyle(PlainButtonStyle())
                    Divider()
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle("Search")
        .onAppear {
            teamViewModel.fetchTeams(hackathonId: hackathonId)
        }
    }
}
struct TeamItemView: View {
    let team: Teams
    
    var body: some View {
        HStack {
            
            VStack{
                Spacer()
                Image(uiImage: team.teamphoto ?? UIImage(named: "team_poster")!)
                    .resizable(resizingMode: .stretch)
                    .frame(width: 85.0, height: 85.0)
                Spacer()
            }
            Spacer()
            VStack(alignment: .leading){
                Text(team.name)
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                Text(team.theme)
                    .font(.title2)
                
                ForEach(team.tech_stack, id: \.self) { tech in
                    Text(tech)
                        .foregroundColor(.black)
                }
            }
            Spacer()
            Spacer()
            ZStack{
                Text("0/\(team.member_count)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
            }
            
        }.padding(.all, 10.0)
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
