//
//  Profile.swift
//  CrewCrafters
//
//  Created by user1 on 09/12/23.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack{
                    Image("bg")
                        .resizable()
                        .frame(width: 400, height: 230)
                        .aspectRatio(contentMode: .fill)
                        .clipShape(CustomShape())
                    
                    Image("user")
                        .resizable()
                        .frame(width: 180, height: 180)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .offset(y: 115)
                }
                .padding(.bottom, 90.0)
                
                Text("Elon Musk")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("Elon Musk")
                    .font(.subheadline)
                    .padding(.bottom)
                
                HStack{
                    Spacer()
                    Spacer()
                    VStack{
                        Text("7")
                            .font(.title3)
                        Text("Projects")
                            .font(.headline)
                        
                    }
                    Spacer()
                    VStack{
                        Text("3")
                            .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                        Text("Teams")
                            .font(.headline)
                    }
                    Spacer()
                    VStack{
                        Text("20")
                            .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                        Text("Followers")
                            .font(.headline)
                    }
                    Spacer()
                    Spacer()
                }
                .padding(.bottom)
                
                
                Text("Featured")
                    .titleStyle()
                
                ScrollView (.horizontal) {
                    HStack (spacing: 15) {
                        ForEach(0..<3){_ in
                            Image("project_poster")
                                .resizable()
                                .frame(width: 250, height: 150)
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(15)
                            Image("project_poster2")
                                .resizable()
                                .frame(width: 250, height: 150)
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(15)
                        }
                    }
                }
                .padding([.leading, .bottom, .trailing])
                
                Spacer()
                
                Text("Tech Stack")
                    .titleStyle()
                
                ScrollView (.horizontal) {
                    HStack (spacing: 10) {
                        ForEach(0..<10){_ in
                            Text("Sample")
                                .padding(10)
                                .background(Color.gray.opacity(0.3))
                                .cornerRadius(15)
                                .lineLimit(1)
                            
                        }
                    }
                }
                .padding([.leading, .bottom, .trailing])
                
                Text("Achievements")
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
                
                
                Text("Hackathons")
                    .titleStyle()
                
                VStack (alignment: .leading, spacing: 15) {
                    ForEach(0..<3){_ in
                        HStack(alignment: .top){
                            Image("hackathon_poster")
                                .resizable()
                                .frame(width: 150, height: 90)
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(15)
                                .padding(.trailing, 5.0)
                            VStack(alignment: .leading){
                                Text("Appel E Defis")
                                    .font(.body)
                                    .fontWeight(.medium)
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vestibulum enim a felis")
                                    .font(.body)
                                    .foregroundColor(Color.gray)
                                    .lineLimit(3)
                            }
                        }
                        Divider()
                    }
                }.padding([.leading, .bottom, .trailing])
                
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
                .navigationTitle("Profile")
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

struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        let radius = rect.width / 4
        let center = CGPoint(x: rect.midX, y: rect.maxY)
        path.addArc(center: center, radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 180), clockwise: true)
        
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        return path
    }
}


#Preview {
    Profile()
}
