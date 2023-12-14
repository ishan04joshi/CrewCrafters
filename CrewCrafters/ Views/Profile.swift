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
                VStack() {
                    ZStack{
                        Image("bg")
                            .resizable()
                            .frame(width: 400, height: 230)
                            .aspectRatio(contentMode: .fill)
                            .clipShape(CustomShape())
                        
                        Image("user")
                            .resizable()
                            .frame(width: 400, height: 250)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .scaleEffect(x: 0.70, y: 0.70)
                            .offset(y: 115)
                    }
                    .padding(.bottom, 80.0)
                    
                    
                    Text("Elon Musk")
                        .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                        .bold()
                    Text("Elon Musk")
                        .font(.subheadline)
                        .padding(.bottom)
                    
                    HStack{
                        Spacer()
                        Spacer()
                        VStack{
                            Text("7")
                                .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
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
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
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
                    .padding(.horizontal)
                    
                    
                    Text("Tech Stack")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                    ScrollView (.horizontal) {
                        HStack (spacing: 10) {
                            ForEach(0..<10){_ in
                                Text("Sample")
                                    .padding(8)
                                    .background(Color.gray.opacity(0.3))
                                    .cornerRadius(10)
                                    .lineLimit(1)
                                
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    
                }
            }.navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        HStack
                        {
                            Button (action: goHome){
                                
                                Image(systemName: "chevron.backward")
                                
                            }
                            
                        }
                        
                    }
                    
                }.navigationTitle("Profile")
                
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
