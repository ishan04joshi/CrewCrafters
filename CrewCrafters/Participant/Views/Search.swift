//
//  Search.swift
//  CrewCrafters
//
//  Created by user1 on 09/12/23.
//

import SwiftUI

struct Search: View {
    @EnvironmentObject var hackathonViewModel: HackathonViewModel
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0){
                HStack {
                    TextField("Search Hackathons", text: $searchText)
                        .padding(8)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal, 8)
                        .padding(.bottom, 8)
                }
                
                ScrollView {
                    ForEach(hackathonViewModel.hackathons.filter {
                        searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText)
                    }) { hackathon in
                        NavigationLink(destination: Hack_Land(hackathonIndex: hackathonViewModel.hackathons.firstIndex(of: hackathon) ?? 0)) {
                            HackathonItemView(hackathon: hackathon)
                        }
                        .buttonStyle(PlainButtonStyle())
                        Divider()
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Search")
            .onAppear {
                hackathonViewModel.fetchHackathons()
            }
        }.navigationBarHidden(true)
    }
}


struct HackathonItemView: View {
    let hackathon: Hackathon
    
    var body: some View {
        VStack {
            Image(uiImage: hackathon.hackathonPoster ?? UIImage(named: "default_hackathon_poster")!)
                .resizable(resizingMode: .stretch)
                .frame(width: 355.0, height: 157.0)
                .cornerRadius(20.0)
                .padding(.all, 10.0)
            
            HStack {
                Text(hackathon.name)
                    .font(.callout)
                    .fontWeight(.bold)
                    .padding([.top, .leading, .trailing], 7.0)
                Spacer()
                HStack {
                    Image(systemName: "calendar")
                    Text("\(formatDate(from: hackathon.startDate)) - \(formatDate(from: hackathon.endDate))")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .padding([.top, .trailing], 7.0)
                }
            }
        }
    }
}
