//
//  Search.swift
//  CrewCrafters
//
//  Created by user1 on 09/12/23.
//

import SwiftUI

struct Search: View {
    @State var showingDetail = false
    @State var searchText = ""
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    Button(action: goHackLand){
                        Image("hackathon_poster")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 355.0, height: 157.0).cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    }

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
                .padding(.all, 10.0)
                Divider()
                
                VStack{
                    Button(action: goHackLand){
                        Image("hackathon_poster1")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 355.0, height: 157.0).cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    }

                    HStack{
                        Text("Horizen Hackathon '23")
                            .font(.callout)
                            .fontWeight(.bold)
                        Spacer()
                        HStack{
                            Image(systemName: "calendar")
                            Text("11oct- 15oct")
                                .font(.callout)
                                .fontWeight(.semibold)
                        }
                        
                    }
                    .padding([.top, .leading, .trailing], 7.0)

                }
                .padding(.all, 10.0)
                Divider()
                
                
                VStack{
                    Button(action: goHackLand){
                        Image("hackathon_poster")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 355.0, height: 157.0).cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    }

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
                    .cornerRadius(20)

                }
                .padding(.all, 10.0)
                Divider()
                
                
                VStack{
                    Button(action: goHackLand){
                        Image("hackathon_poster1")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 355.0, height: 157.0).cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    }

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
                .padding(.all, 10.0)
                
                Divider()
                
                
            }.searchable(text: $searchText)          .navigationBarBackButtonHidden(true)
                .navigationTitle("Hackathons")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        
                        Button (action: goHome){
                            HStack {
                                Image(systemName: "chevron.backward")
                                Text("Home")
                            }
                        }
                    }
                }
                .contentMargins(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
        }
    }
}






#Preview {
    Search()
}
