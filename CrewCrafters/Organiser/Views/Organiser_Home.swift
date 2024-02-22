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
                    Text("Pending Hackathons")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    ForEach(hackathonViewModel.hackathons.filter { !$0.status }) { hackathon in
                        HackathonView(hackathon: hackathon)
                    }
                }
                .listRowSeparator(.hidden)
                
                
                Section {
                    Text("Approved Hackathons")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    ForEach(hackathonViewModel.hackathons.filter { $0.status }) { hackathon in
                        HackathonView(hackathon: hackathon)
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Welcome! SIIEC")
            
        }
    }
}

struct HackathonView: View {
    let hackathon: Hackathon
    @EnvironmentObject var hackathonViewModel: HackathonViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(
                destination: Hack_Land(hackathonIndex: hackathonViewModel.hackathons.firstIndex(of: hackathon) ?? 0),
                label: {
                    VStack(alignment: .leading) {
                        Image(uiImage: hackathon.hackathonPoster ?? UIImage(named: "default_hackathon_poster")!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 355.0, height: 157.0)
                            .cornerRadius(20.0)
                        
                        HStack {
                            Text(hackathon.name)
                                .font(.callout)
                                .fontWeight(.bold)
                            Spacer()
                            HStack {
                                Image(systemName: "calendar")
                                Text("\(formatDate(from: hackathon.startDate)) - \(formatDate(from: hackathon.endDate))")
                                    .font(.callout)
                                    .fontWeight(.semibold)
                            }
                        }
                        .padding([.top, .leading, .trailing], 7.0)
                    }
                }
            )
            .buttonStyle(PlainButtonStyle())
        }
        .padding(.all, 10.0)
    }
}


func formatDate(from date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .none
    return formatter.string(from: date)
}

