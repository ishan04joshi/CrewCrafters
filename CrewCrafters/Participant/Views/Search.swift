//
//  Search.swift
//  CrewCrafters
//
//  Created by user1 on 09/12/23.
//

import SwiftUI

struct Search: View {
    @EnvironmentObject var hackathonViewModel: HackathonViewModel
    @EnvironmentObject var teamViewModel: TeamsViewModel
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(spacing: 0){
                    HStack {
                        TextField("Search Hackathons", text: $searchText)
                            .padding(8)
                            .background(Color(.systemGray6))
                        
                            .cornerRadius(8)
                            .padding(.horizontal)
                            .padding(.bottom)
                    }.padding(.vertical, 10)
                    
                    ScrollView {
                        ForEach(hackathonViewModel.hackathons.filter {
                            searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText)
                        }) { hackathon in
                            NavigationLink(destination: Hack_Land(hackathonIndex: hackathonViewModel.hackathons.firstIndex(of: hackathon) ?? 0)) {
                                HackathonItemView(hackathon: hackathon)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .padding(.bottom)
                        }
                    }.shadow(color: Color.gray.opacity(0.3), radius: 5, x: 4, y: 4)
                        .padding(.horizontal)
                }.background(Color.black)
                    .foregroundColor(Color.white)
                
                    .onAppear {
                        hackathonViewModel.fetchHackathons()
                    }
            }

                .background(Color.black)
        }

    }
}

struct HackathonItemView: View {
    let hackathon: Hackathon
    @EnvironmentObject var teamViewModel: TeamsViewModel
    @EnvironmentObject var hackathonViewModel: HackathonViewModel
    @State private var teamCount: Int = 0
    @State private var teamPosters: [UIImage] = []
    
    var body: some View {
        VStack(alignment: .leading, spacing: 7)  {
            ZStack(alignment: .bottomLeading) {
                Image(uiImage: hackathon.hackathonPoster ?? UIImage(named: "default_hackathon_poster")!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 340.0, height: 200.0)
                    .clipShape(
                        .rect(
                            topLeadingRadius: 10,
                            bottomLeadingRadius: 0,
                            bottomTrailingRadius: 0,
                            topTrailingRadius: 10
                        )
                    )
                    .overlay(
                        LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                            .frame(width: 340.0, height: 200.0)
                            .clipShape(
                                .rect(
                                    topLeadingRadius: 10,
                                    bottomLeadingRadius: 0,
                                    bottomTrailingRadius: 0,
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
            }.shadow(color: Color.gray.opacity(0.3), radius: 2, y: 1)
           
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
                    .foregroundStyle(Color.gray)
                }
                .padding(.leading)
                .padding(.bottom)
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    HStack {
                        HStack(spacing: -10) {
                            if !teamPosters.isEmpty {
                                ForEach(teamPosters.prefix(3), id: \.self) { poster in
                                    Image(uiImage: poster)
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .clipShape(Circle())
                                }
                            }
                        }
                        .onAppear {
                            teamViewModel.fetchTeamPosters(for: hackathon.id) { posters in
                                teamPosters = posters
                            }
                        }
                        Text("\(teamCount)")
                            .font(.caption)
                            .onAppear {
                                teamViewModel.fetchTeamCount(for: hackathon.id) { count in
                                    teamCount = count
                                }
                            }
                    }
                }
            }
            .padding(.trailing)
            HStack{
                Spacer()
                Spacer()
                
                NavigationLink(destination: Hack_Teams(hackathonIndex: hackathonViewModel.hackathons.firstIndex(of: hackathon) ?? 0)){
                    Text("Join a Team")
                        .foregroundColor(.blue)
                }
                .buttonStyle(.bordered)
                .tint(.blue)
                Spacer()
                Spacer()
                NavigationLink(destination: Team_create(hackathonIndex: hackathonViewModel.hackathons.firstIndex(of: hackathon) ?? 0)){
                    Text("Make a Team")
                        .foregroundColor(.blue)
                }
                .buttonStyle(.bordered)
                .tint(.blue)
                Spacer()
                Spacer()
            }
            
        }
        .padding(.bottom)
        .background(Color.black)
        .foregroundColor(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 3, y: 3)
        .padding(.horizontal)
    }
}

//struct Organizer_Create_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            Search()
//        }
//        .environmentObject(HackathonViewModel())
//    }
//}


struct Search_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Search()
                .environmentObject(HackathonViewModel())
                .environmentObject(TeamsViewModel())
        }
    }
}
