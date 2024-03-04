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
    @EnvironmentObject var hackathonViewModel: HackathonViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ZStack {
                Image(uiImage: hackathon.hackathonPoster ?? UIImage(named: "default_hackathon_poster")!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 340.0, height: 200.0)
                    .cornerRadius(20.0)
                
                //                RoundedRectangle(cornerRadius: 20)
                //                    .stroke(Color.gray.opacity(0.2), lineWidth: 2)
                //                    .frame(width: 350.0, height: 200.0)
            }
            
            HStack {
                Text(hackathon.name)
                    .font(.callout)
                    .fontWeight(.bold)
                
                Spacer()
                
                HStack(spacing: 4) {
                    Image(systemName: "calendar")
                    Text("\(formatDate(from: hackathon.startDate)) - \(formatDate(from: hackathon.endDate))")
                        .font(.callout)
                        .fontWeight(.semibold)
                }
            }
            .padding()
        }
        .padding(5)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.2), radius: 3, x: 3, y: 3)
        .background(
            NavigationLink(destination: Hack_Land(hackathonIndex: hackathonViewModel.hackathons.firstIndex(of: hackathon) ?? 0)) {
                EmptyView()
            }
                .opacity(0)
        )
        .buttonStyle(PlainButtonStyle())
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
