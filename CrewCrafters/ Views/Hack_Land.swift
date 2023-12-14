//
//  Hack_Land.swift
//  CrewCrafters
//
//  Created by user1 on 09/12/23.
//

import SwiftUI

struct Hack_Land: View {
    @State var showingDetail = false
    
    var body: some View {
        
        
        NavigationView{
            
            ScrollView{
                VStack(alignment: .center){
                    
                    Text("Ocean Hackathon®: data, an event and an international community")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Image("hackathon_poster")
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Text("The Ambassadors perceive the sea as a field of innovation that must be appropriated but also made known and protected. They are by our side and award the teams on the podium of the Grand Finale.")
                        .font(.headline)
                    Spacer()
                    
                    HStack
                    {
                        VStack(alignment: .leading)
                        {
                            Text("Themes: ")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text("Artificial Intelligence.")
                            Text("Natural Language Processing.")
                            Text("App: Weather API.")
                            Text("Deep Learning: Augmented Reality (AR).")
                            Text("Marketplace and Community Hub.")
                            
                        }
                        Spacer()
                    }
                    Spacer()
                    HStack
                    {
                        VStack(alignment: .leading)
                        {
                            Text("Partners: ")
                                .font(.title3)
                                .fontWeight(.semibold)
                            HStack{
                                Spacer()
                                Image("partner1").resizable(resizingMode: .stretch)
                                    .frame(width: 85.0, height: 85.0)
                                Spacer()
                                Image("partner2").resizable(resizingMode: .stretch)
                                    .frame(width: 85.0, height: 85.0)
                                Spacer()
                                Image("partner3").resizable(resizingMode: .stretch)
                                    .frame(width: 85.0, height: 85.0)
                                Spacer()
                            }
                            
                        }
                        
                        Spacer()
                    }
                    Spacer()
                    HStack{
                        Button(action: {
                            self.showingDetail.toggle()
                        }) {
                            Text("Join a Team")
                        }.sheet(isPresented: $showingDetail) {
                            Hack_teams()
                        }.buttonStyle(.bordered)
                            .tint(.blue)
                        Button (action: goTeamCreate){
                            Text("Make a Team")
                        }.sheet(isPresented: $showingDetail) {
                            Team_create()
                        }.buttonStyle(.bordered)
                            .tint(.blue)
                        
                    }
                    Spacer()
                    
                    
                    
                }.navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            HStack
                            {
                                Button (action: goSearch){
                                    
                                    Image(systemName: "chevron.backward")
                                    
                                }
                                
                            }
                            
                        }
                        
                    }.navigationTitle("Hackathon").padding(.all, 7)
                
            }
        }
    }
}


#Preview {
    Hack_Land()
}
