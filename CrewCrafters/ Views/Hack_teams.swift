//
//  Hack_teams.swift
//  CrewCrafters
//
//  Created by user1 on 09/12/23.
//

import SwiftUI

struct Hack_teams: View {
    @State var searchText = ""
    var body: some View {
        NavigationView{
            List{
                VStack{
                    HStack{
                        Spacer()
                        VStack{
                            Spacer()
                            AsyncImage(url: URL(string: "https://www.shutterstock.com/image-vector/two-humans-operate-each-computers-260nw-2153516973.jpg"))
                                .frame(width: 85.0, height: 85.0)
                            Spacer()
                        }
                        Spacer()
                        VStack(alignment: .leading){
                            Text("Team Name")
                                .font(.title2)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                            Text("Domain")
                                .font(.title2)
                            
                            Button("Open Position 1") {
                                
                            }.buttonStyle(.bordered)
                                .tint(.black)
                            Button("Open Position 2") {
                                
                            }.buttonStyle(.bordered)
                                .tint(.black)
                        }
                        Spacer()
                        ZStack{
                            Text("2/5")
                                .font(.largeTitle)
                                .foregroundColor(Color.blue)
                        }
                        Spacer()
                    }
                    
                    VStack{
                        HStack{
                            Spacer()
                            VStack{
                                Spacer()
                                AsyncImage(url: URL(string: "https://www.shutterstock.com/image-vector/two-humans-operate-each-computers-260nw-2153516973.jpg"))
                                    .frame(width: 85.0, height: 85.0)
                                Spacer()
                            }
                            Spacer()
                            VStack(alignment: .leading){
                                Text("Team Name")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.leading)
                                Text("Domain")
                                    .font(.title2)
                                
                                Button("Open Position 1") {
                                    
                                }.buttonStyle(.bordered)
                                    .tint(.black)
                                Button("Open Position 2") {
                                    
                                }.buttonStyle(.bordered)
                                    .tint(.black)
                            }
                            Spacer()
                            ZStack{
                                Text("2/5")
                                    .font(.largeTitle)
                                    .foregroundColor(Color.blue)
                            }
                            Spacer()
                        }
                    }
                    
                    
                }
                .padding(.bottom, 20.0)
                
                
            }.searchable(text: $searchText)
                .navigationTitle("Teams")
        }
    }
}

#Preview {
    Hack_teams()
}
