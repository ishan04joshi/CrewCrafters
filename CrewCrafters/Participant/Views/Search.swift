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
                        .padding(.horizontal)
                        .padding(.bottom)
                }
                
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
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 340.0, height: 200.0)
                .cornerRadius(20.0)
            
            HStack {
                Text(hackathon.name)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Spacer()
                
                HStack(spacing: 3) {
                    Image(systemName: "calendar")
                        .font(.title2)
                    VStack{
                        Text("\(formatDate(from: hackathon.startDate))")
                            .font(.callout)
                            .fontWeight(.semibold)
                        Text("\(formatDate(from: hackathon.endDate))")
                            .font(.callout)
                            .fontWeight(.semibold)
                    }
                }
            }
            .padding()
        }
        .padding(5)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.2), radius: 3, x: 3, y: 3)
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
