//
//  Hack_Teams.swift
//  CrewCrafters
//
//  Created by user1 on 09/12/23.
//

import SwiftUI

struct Hack_Teams: View {
    let hackathonIndex: Int
    @EnvironmentObject var hackathonViewModel: HackathonViewModel
    @State var searchText = ""
    var body: some View {
        if hackathonIndex < hackathonViewModel.hackathons.count {
            let hackathon = hackathonViewModel.hackathons[hackathonIndex]
            let image = "team_poster"
            ScrollView {
                HStack {
                    
                    VStack{
                        Spacer()
                        Image("team_poster")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 85.0, height: 85.0)
                        Spacer()
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        Text("Team A")
                            .font(.title2)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                        Text("Domain")
                            .font(.title2)
                        
                        
                        Button(action: {print("")}) {
                            NavigationLink(destination: Team_info(name: "Team A", image: image)){
                                Text("Open Position 1").foregroundColor(.black)
                            }
                        }.buttonStyle(.bordered)
                            .tint(.black)
                        
                        
                        Button(action: {print("")}) {
                            NavigationLink(destination: Team_info(name: "Team A",image: image)){
                                Text("Open Position 2").foregroundColor(.black)
                            }
                        }.buttonStyle(.bordered)
                            .tint(.black)
                    }
                    Spacer()
                    Spacer()
                    ZStack{
                        Text("2/5")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.blue)
                    }
                    
                }.padding(.all, 10.0)
                Divider()
                
                //card2
                
                HStack{
                    
                    VStack{
                        Spacer()
                        Image("team_poster")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 85.0, height: 85.0)
                        Spacer()
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        Text("Team B")
                            .font(.title2)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                        Text("Domain")
                            .font(.title2)
                        Spacer()
                        Spacer()
                        
                        
                        Button(action: {print("")}) {
                            NavigationLink(destination: Team_info(name: "Team B",image: image)){
                                Text("Open Position 1").foregroundColor(.black)
                            }
                        }.buttonStyle(.bordered)
                            .tint(.black)
                        
                    }
                    Spacer()
                    Spacer()
                    ZStack{
                        Text("1/5")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.red)
                    }
                    
                }.padding(.all, 10.0)
                Divider()
                
                
                //card3
                
                HStack{
                    
                    VStack{
                        Spacer()
                        Image("team_poster")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 85.0, height: 85.0)
                        Spacer()
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        Text("Team C")
                            .font(.title2)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                        Text("Domain")
                            .font(.title2)
                        
                        Button(action: {print("")}) {
                            NavigationLink(destination: Team_info(name: "Team C",image: image)){
                                Text("Open Position 1").foregroundColor(.black)
                            }
                        }.buttonStyle(.bordered)
                            .tint(.black)
                        
                        Button(action: {print("")}) {
                            NavigationLink(destination: Team_info(name: "Team C",image: image)){
                                Text("Open Position 2").foregroundColor(.black)
                            }
                        }.buttonStyle(.bordered)
                            .tint(.black)
                    }
                    Spacer()
                    Spacer()
                    ZStack{
                        Text("3/5")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.blue)
                    }
                    
                }.padding(.all, 10.0)
                Divider()
                
                
                
                //card4
                
                HStack{
                    
                    VStack{
                        Spacer()
                        Image("team_poster")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 85.0, height: 85.0)
                        Spacer()
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        Text("Team D")
                            .font(.title2)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                        Text("Domain")
                            .font(.title2)
                        
                        Button(action: {print("")}) {
                            NavigationLink(destination: Team_info(name: "Team D",image: image)){
                                Text("Open Position 1").foregroundColor(.black)
                            }
                        }.buttonStyle(.bordered)
                            .tint(.black)
                        
                        
                        Button(action: {print("")}) {
                            NavigationLink(destination: Team_info(name: "Team D",image: image)){
                                Text("Open Position 2").foregroundColor(.black)
                            }
                        }.buttonStyle(.bordered)
                            .tint(.black)
                        
                        
                    }
                    Spacer()
                    Spacer()
                    ZStack{
                        Text("4/6")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.blue)
                    }
                    
                }.padding(.all, 10.0)
                Divider()
                
            }.searchable(text: $searchText)
                .navigationTitle("\(hackathon.name)'s Teams")
                .contentMargins(.horizontal, 10)
        }
        
    }
}

struct HackLand_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Hack_Teams(hackathonIndex: 0)
        }
        .environmentObject(HackathonViewModel())
    }
}
