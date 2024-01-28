//
//  Admin_Approved.swift
//  CrewCrafters
//
//  Created by user1 on 16/01/24.
//

import SwiftUI

struct Admin_Approved: View {
    let hackathon: Hackathon
    @EnvironmentObject var hackathonViewModel: HackathonViewModel
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    NavigationLink(destination: Hack_Land(hackathonIndex: hackathonViewModel.hackathons.firstIndex(of: hackathon) ?? 0),label: {
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
                    NavigationLink(destination: Hack_Land(hackathonIndex: hackathonViewModel.hackathons.firstIndex(of: hackathon) ?? 0),label: {
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
                
                VStack{
                    NavigationLink(destination: Hack_Land(hackathonIndex: hackathonViewModel.hackathons.firstIndex(of: hackathon) ?? 0),label: {
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
                    NavigationLink(destination: Hack_Land(hackathonIndex: hackathonViewModel.hackathons.firstIndex(of: hackathon) ?? 0),label: {
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
            .foregroundStyle(.primary)
            .navigationTitle("Approved Hackathons")
            
        }
    }
}

//
//#Preview {
//    Admin_Approved()
//}
