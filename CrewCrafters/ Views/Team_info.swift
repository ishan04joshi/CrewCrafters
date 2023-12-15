//
//  Team_info.swift
//  CrewCrafters
//
//  Created by user1 on 09/12/23.
//

import SwiftUI

struct Team_info: View {
    @State var showingDetail = false
    
    var body: some View {
        

            ScrollView{
                VStack(alignment: .leading){
                    Image("hackathon_poster")
                        .resizable()
                        .frame(width: 375.0, height: 195.0)
                        .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    
                    HStack
                    {
                        Text("Themes: ")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Text("Smart Education")
                        
                        
                    }
                    VStack(alignment: .leading){
                        Text("Problem Statement:").font(.title3).fontWeight(.semibold)
                        Text("Sed ut perspiciatis, unde omnis iste natus error sit volupt atem accum santium doloremque lauda ntium")
                    }
                    Spacer()
                    
                    Text("Team members:")
                        .font(.title3)
                        .fontWeight(.bold)
                }
                HStack{
                    
                    VStack{
                        Spacer()
                        Image(systemName: "person.crop.circle.dashed.circle.fill")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 65.0, height: 65.0)
                        Spacer()
                    }.frame(width: 80.0)
                    VStack(alignment: .leading){
                        Text("Ishan Joshi")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                        Text("Web Developer")
                            .font(.subheadline)
                        
                    }
                    Spacer()
                    Spacer()
                    ZStack{
                        Text("Admin")
                            .font(.title)
                            .padding(.trailing, 10.0)
                            .fontWeight(.bold)
                            .foregroundColor(Color.green)
                    }
                    
                }.padding(.all, 10.0)
                Divider()
                
                HStack{
                    
                    VStack{
                        Spacer()
                        Image(systemName: "person.crop.circle")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 65.0, height: 65.0)
                        Spacer()
                    }.frame(width: 80.0)

                    VStack(alignment: .leading){
                        Text("Position 1:")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                        Text("Web Developer")
                            .font(.subheadline)
                        
                    }
                    Spacer()
                    Spacer()
                    ZStack{
                        Button("Apply Now") {
                            
                        }.buttonStyle(.bordered)
                            .tint(Color.blue)
                    }
                    
                }.padding(.all, 10.0)
                Divider()
                HStack{
                    
                    VStack{
                        Spacer()
                        Image(systemName: "person.crop.circle")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 65.0, height: 65.0)
                        Spacer()
                    }.frame(width: 80.0)

                    VStack(alignment: .leading){
                        Text("Position 2:")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                        Text("App Developer")
                            .font(.subheadline)
                        
                    }
                    Spacer()
                    Spacer()
                    ZStack{
                        Button("Apply Now") {
                            
                        }.buttonStyle(.bordered)
                            .tint(Color.blue)
                    }
                    
                }.padding(.all, 10.0)
                Divider()
                HStack{
                    
                    VStack{
                        Spacer()
                        Image(systemName: "person.crop.circle")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 65.0, height: 65.0)
                        Spacer()
                    }.frame(width: 80.0)

                    VStack(alignment: .leading){
                        Text("Position 3:")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                        Text("AI Engineer")
                            .font(.subheadline)
                        
                    }
                    Spacer()
                    Spacer()
                    ZStack{
                        Button("Apply Now") {
                            
                        }.buttonStyle(.bordered)
                            .tint(Color.blue)
                    }
                    
                }.padding(.all, 10.0)
                Divider()
                
                
                HStack{
                    
                    VStack{
                        Spacer()
                        Image(systemName: "person.crop.circle")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 65.0, height: 65.0)
                        Spacer()
                    }.frame(width: 80.0)

                    VStack(alignment: .leading){
                        Text("Position 4:")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                        Text("Backend Developer")
                            .font(.subheadline)
                        
                    }
                    Spacer()
                    Spacer()
                    ZStack{
                        Button("Apply Now") {
                            
                        }.buttonStyle(.bordered)
                            .tint(Color.blue)
                    }
                    
                }.padding(.all, 10.0)
                Divider()
                HStack{
                    
                    VStack{
                        Spacer()
                        Image(systemName: "person.crop.circle")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 65.0, height: 65.0)
                        Spacer()
                    }.frame(width: 80.0)

                    VStack(alignment: .leading){
                        Text("Position 5:")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                        Text("Database Engineer")
                            .font(.subheadline)
                        
                    }
                    Spacer()
                    Spacer()
                    ZStack{
                        Button("Apply Now") {
                            
                        }.buttonStyle(.bordered)
                            .tint(Color.blue)
                    }
                    
                }.padding(.all, 10.0)
                Divider()
                
                Spacer()
                
            }.navigationBarTitleDisplayMode(.inline).navigationTitle("Team A").padding(.all, 10)
        }
}

#Preview {
    Team_info()
}
