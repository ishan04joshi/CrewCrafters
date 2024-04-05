//
//  Team_Space.swift
//  CrewCrafters
//
//  Created by admin on 22/03/24.
//

import SwiftUI

struct Team_Space: View {
    let hackathonIndex: Int
    
    @EnvironmentObject var hackathonViewModel: HackathonViewModel
    @EnvironmentObject var teamViewModel: TeamsViewModel
    @State private var searchText = ""
    
    var body: some View {
        let hackathonId = "09qcfYWs50dyk9fgcbBc"
        let hackathon = hackathonViewModel.hackathons[hackathonIndex]
        NavigationView {
            VStack(spacing: 0){
                HStack {
                    TextField("Search", text: $searchText)
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
                        NavigationLink(destination: Team_view(teamIndex: teamViewModel.teams.firstIndex(of: team) ?? 0,hid:hackathonId)) {
                            TeamSpaceItemView(team: team)
                        }
                        .buttonStyle(PlainButtonStyle())
                        Divider()
                    }
                }
                .padding(.horizontal)
                
            }
            .navigationTitle("Your Teams")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack
                    {
                        Button(action: {}){
                            NavigationLink(destination: Team_create(hackathonIndex: hackathonViewModel.hackathons.firstIndex(of: hackathon) ?? 0)){
                                Image(systemName: "plus.circle")
                                
                            }
                        }
                    }
                }
            }

        }
    }

}
struct TeamSpaceItemView: View {
    let team: Teams
    
    var body: some View {
        VStack(alignment: .trailing){
            HStack {
                
                VStack{
                    Spacer()
                    Image(uiImage: team.teamphoto ?? UIImage(named: "team_poster")!)
                        .resizable(resizingMode: .stretch)
                        .clipShape(Circle())
                        .frame(width: 65.0, height: 65.0)
                    Spacer()
                }
                Spacer()
                VStack(alignment: .leading){
                    Text(team.name)
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    Text("Chat..")
                        .foregroundColor(.green)
                        .font(.caption)
                        .multilineTextAlignment(.leading)
                }
                Spacer()
                
            }.padding(.all, 10.0)
        }
        .padding(.bottom)
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 3, y: 3)
            .padding(.horizontal)
    }
}

//struct Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            Team_Space(hackathonIndex: 0)
//        }
//        .environmentObject(HackathonViewModel())
//    }
//}

struct Previews: PreviewProvider {
    static var previews: some View {
        let hackathonViewModel = HackathonViewModel() // Create an instance of your
        let teamViewModel = TeamsViewModel()
        NavigationView {
            Team_Space(hackathonIndex: 0)
                .environmentObject(hackathonViewModel)
                .environmentObject(teamViewModel)
        }
    }
}

