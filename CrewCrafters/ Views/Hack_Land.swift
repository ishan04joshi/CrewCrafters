//
//  Hack_Land.swift
//  CrewCrafters
//
//  Created by user1 on 09/12/23.
//

import SwiftUI

struct Hack_Land: View {
    @State var showingDetail = false
    var title: String
    var body: some View {
        
            
            ScrollView{
                
                VStack{
                    Text("Ocean Hackathon®: data, an event and an international community")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.bottom, 10.0)
                    
                    Image("hackathon_poster")
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Text("The Ambassadors perceive the sea as a field of innovation that must be appropriated but also made known and protected. They are by our side and award the teams on the podium of the Grand Finale.")
                        .font(.headline)
                        .padding(.top, 10.0)
                }
                Spacer()
                    .padding(.bottom, 20.0)
                HStack{
                    Spacer()
                    Button(action: {print("")}){
                        NavigationLink(destination: Hack_teams()){
                            Text("Join a Team")
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        }
                    }.buttonStyle(.bordered)
                        .tint(.blue)
                    Spacer()
                    Button(action: {print("")}){
                        NavigationLink(destination: Team_create()){
                            Text("Make a Team")
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        }
                    }.buttonStyle(.bordered)
                        .tint(.blue)
                    Spacer()
                }
                
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
                .padding(.vertical, 10.0)
                Spacer()
                    .padding(.bottom, 10.0)
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
                            Spacer()
                            Image("partner2").resizable(resizingMode: .stretch)
                                .frame(width: 85.0, height: 85.0)
                            Spacer()
                            Spacer()
                            Image("partner3").resizable(resizingMode: .stretch)
                                .frame(width: 85.0, height: 85.0)
                            Spacer()
                        }
                        
                    }
                    
                    Spacer()
                }
                Spacer()
                
                Spacer()
                
                
                
            }.navigationTitle(title).padding(.all, 7)
            
            
        
    }
}


#Preview {
    Hack_Land( title: String())
}
