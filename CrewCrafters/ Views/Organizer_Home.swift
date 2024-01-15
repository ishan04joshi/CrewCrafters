//
//  Search.swift
//  CrewCrafters
//
//  Created by user1 on 09/12/23.
//

import SwiftUI

struct Organizer_Home: View {
    
    var body: some View {
        NavigationView{
            ScrollView{
                HStack{
                    Text("Approved Hackthones")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                }.padding(.all, 10.0)
                VStack(alignment: .leading){
                    NavigationLink(destination: Hack_Land(title: "Ocean", image: "hackathon_poster"),label: {
                        VStack{
                            Image("hackathon_poster")
                                .resizable(resizingMode: .stretch)
                                .frame(width: 355.0, height: 157.0).cornerRadius(20.0)
                            
                            
                            HStack{
                                Text("Ocean Hackathon '23")
                                    .font(.callout)
                                    .fontWeight(.bold)
                                Spacer()
                                HStack{
                                    Image(systemName: "calendar")
                                    Text("15sept- 21sept")
                                        .font(.callout)
                                        .fontWeight(.semibold)
                                }
                                
                            }
                            .padding([.top, .leading, .trailing], 7.0)
                        }
                    })
                    
                }
                .padding(.all, 10.0)
                Divider()
                
                HStack{
                    Text("Pending Requests")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                }.padding(.all, 10.0)
                
                VStack{
                    NavigationLink(destination: Hack_Land(title: "Horizen",image: "hackathon_poster1"),label: {
                        VStack{
                            Image("hackathon_poster1")
                                .resizable(resizingMode: .stretch)
                                .frame(width: 355.0, height: 157.0).cornerRadius(20.0)
                            
                            
                            HStack{
                                Text("Horizen Hackathon '23")
                                    .font(.callout)
                                    .fontWeight(.bold)
                                Spacer()
                                HStack{
                                    Image(systemName: "calendar")
                                    Text("15sept- 21sept")
                                        .font(.callout)
                                        .fontWeight(.semibold)
                                }
                                
                            }
                            .padding([.top, .leading, .trailing], 7.0)
                        }
                    })
                    
                }
                .padding(.all, 10.0)
                Divider()
                
                VStack{
                    NavigationLink(destination: Hack_Land(title: "Ocean", image: "hackathon_poster"),label: {
                        VStack{
                            Image("hackathon_poster")
                                .resizable(resizingMode: .stretch)
                                .frame(width: 355.0, height: 157.0).cornerRadius(20.0)
                            
                            
                            HStack{
                                Text("Ocean Hackathon '23")
                                    .font(.callout)
                                    .fontWeight(.bold)
                                Spacer()
                                HStack{
                                    Image(systemName: "calendar")
                                    Text("15sept- 21sept")
                                        .font(.callout)
                                        .fontWeight(.semibold)
                                }
                                
                            }
                            .padding([.top, .leading, .trailing], 7.0)
                        }
                    })
                    
                }
                .padding(.all, 10.0)
                Divider()
                
                Spacer()
                
            }
            .foregroundStyle(Color.black)
            .navigationTitle("Welcome! SIIEC")
            
        }
    }
}






#Preview {
    Organizer_Home()
}
