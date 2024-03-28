//
//  Organiser_Home.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 17/01/24.
//

import SwiftUI

struct Organizer_Home: View {
    @EnvironmentObject var hackathonViewModel: HackathonViewModel
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Text("Hackathons")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    ForEach(hackathonViewModel.hackathons.filter { !$0.status }) { hackathon in
                        HackathonView(hackathon: hackathon)
                    }
                }
                .listRowSeparator(.hidden)
                
                //                Section {
                //                    Text("Approved Hackathons")
                //                        .font(.headline)
                //                        .fontWeight(.bold)
                //
                //                    ForEach(hackathonViewModel.hackathons.filter { $0.status }) { hackathon in
                //                        HackathonView(hackathon: hackathon)
                //                    }
                //                }
                //                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Welcome Organizer!")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                hackathonViewModel.fetchHackathons()
            }
        }
    }
}

struct HackathonView: View {
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
            
        }
        .padding(.bottom)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 3, y: 3)
        .padding(.horizontal)
        .background(
            NavigationLink(destination: Hack_Land(hackathonIndex: hackathonViewModel.hackathons.firstIndex(of: hackathon) ?? 0)) {
                EmptyView()
            }.opacity(0)
        )
    }
}


func formatDate(from date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd MMM yy"
    return formatter.string(from: date)
}

//struct Organizer_Create_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            Organizer_Home()
//        }
//        .environmentObject(HackathonViewModel())
//    }
//}
