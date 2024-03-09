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
    @EnvironmentObject var hackathonViewModel: HackathonViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Image(uiImage: profileViewModel.currentProfile.profilephoto ?? UIImage(named: "user")!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60)
                            .clipShape(Circle())
                        Text("Hello, \(profileViewModel.currentProfile.name)!")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding()
                    
                    
                    Text("Trending Hackathons")
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
                        .titleStyle()
                    
                    ForEach(0..<2){_ in
                        VStack(alignment: .leading) {
                            HStack {
                                Image(uiImage: profileViewModel.currentProfile.profilephoto ?? UIImage(named: "user")!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                                    .frame(width: 50)
                                VStack(alignment: .leading) {
                                    Text(profileViewModel.currentProfile.name)
                                        .fontWeight(.bold)
                                    HStack(alignment: .center, spacing: 3) {
                                        Text("Amaze Team")
                                            .fontWeight(.semibold)
                                        Image(systemName: "person.3.fill")
                                            .font(.caption)
                                    }
                                    .foregroundStyle(Color.black.opacity(0.5))
                                }
                            }
                            .padding(8)
                            
                            Text("Just applied in Amaze Team for Ocean Hackathon as Web Developer")
                                .lineLimit(...6)
                                .padding(8)
                            
                            Image("hackathon_poster")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(20)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: Color.black.opacity(0.2), radius: 3, x: 3, y: 5)
                    }
                    .padding([.leading, .bottom, .trailing])
                }.onAppear(){
                    profileViewModel.fetchProfile(userId: userViewModel.userId)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack
                    {
                        Button(action: {}){
                            NavigationLink(destination: Notification()){
                                Image(systemName: "bell.fill")
                                
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ParticipantHomeHackathonView: View {
    let hackathon: Hackathon
    
    var body: some View {
        Image(uiImage: hackathon.hackathonPoster ?? UIImage(named: "default_hackathon_poster")!)
            .resizable()
            .frame(width: 250, height: 150)
            .aspectRatio(contentMode: .fit)
            .cornerRadius(15)
    }
}


#Preview {
    ParticipantHome()
}
