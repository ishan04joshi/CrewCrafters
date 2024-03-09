//
//  Profile.swift
//  CrewCrafters
//
//  Created by user1 on 09/12/23.
//

import SwiftUI

struct Organiser_Profile: View {
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack{
                    Image("default_hackathon_poster")
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .frame(width: 400.0, height: 230)
                        .aspectRatio(contentMode: .fill)
                    
                    Image("user")
                        .resizable()
                        .frame(width: 180, height: 180)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .offset(y: 115)
                }
                .padding(.bottom, 90.0)
                
                Text("SIIEC SRM")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("Entrepreneur ")
                    .font(.subheadline)
                    .padding(.bottom)
                
                HStack{
                    Spacer()
                    Spacer()
                    VStack{
                        Text("7")
                            .font(.title2)
                        Text("Hackathons").font(.headline)
                        
                    }
                    Spacer()
                  
                    Spacer()
                    VStack{
                        Text("200")
                            .font(.title2)
                        Text("Followers")
                            .font(.headline)
                    }
                    Spacer()
                    Spacer()
                }
                .padding(.bottom)
                
                
                Text("Featured Hackathons")
                    .titleStyle()
                
                ScrollView (.horizontal) {
                    HStack (spacing: 15) {
                        ForEach(0..<3){_ in
                            Image("hackathon_poster")
                                .resizable()
                                .frame(width: 250, height: 150)
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(15)
                            Image("hackathon_poster1")
                                .resizable()
                                .frame(width: 250, height: 150)
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(15)
                        }
                    }
                }
                .padding([.leading, .bottom, .trailing])
                
                Spacer()
                
                
                Text("Events")
                    .titleStyle()
                
                ScrollView (.horizontal) {
                    HStack (spacing: 15) {
                        ForEach(0..<5){_ in
                            ZStack{
                                RoundedRectangle(cornerRadius: 15)
                                    .strokeBorder(Color.gray.opacity(0.5), lineWidth: 1)
                                    .frame(width: 150, height: 150)
                                    .overlay(
                                        Image("badge")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .padding(10)
                                    )
                            }
                            
                        }
                    }
                }
                .padding([.leading, .bottom, .trailing])
                
                Text("About")
                    .titleStyle()
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vestibulum enim a felis faucibus ultrices. Donec sed hendrerit justo. Nunc convallis metus eget sem euismod mollis. Praesent laoreet lacus sed mauris viverra porta sit amet non urna.")
                    .font(.body)
                    .lineLimit(5)
                    .padding([.leading, .bottom, .trailing])
                
                
                
                
                Text("Endorsements")
                    .titleStyle()
                
                VStack (alignment: .leading, spacing: 10) {
                    ForEach(0..<3){_ in
                        HStack{
                            Image("user")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .padding(.trailing, 5.0)
                            VStack(alignment: .leading){
                                Text("Bhupinder Jogi")
                                    .font(.body)
                                    .fontWeight(.medium)
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing")
                                    .font(.body)
                                    .foregroundColor(Color.gray)
                                    .lineLimit(1)
                            }
                        }
                        Divider()
                    }
                }
                .padding([.leading, .bottom, .trailing])
                .navigationTitle("Organiser Profile")
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack
                    {
                        Button(action: {}){
                            NavigationLink(destination: Settings()){
                                Image(systemName: "gear")
                                
                            }
                        }
                    }
                }
            }
        }
    }
}



#Preview {
    Organiser_Profile()
}
