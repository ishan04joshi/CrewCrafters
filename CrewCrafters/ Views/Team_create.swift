//
//  Team_create.swift
//  CrewCrafters
//
//  Created by user1 on 09/12/23.
//

import SwiftUI

struct Team_create: View {
    @State var showingDetail = false
    @State var name: String = ""
    @State var theme: String = ""
    @State var problem: String = ""
    @State var techstack: String = ""
    @State var details: String = ""
    @State var member_count: Int = 0
    @State var n: Int = 1
    
    var body: some View {
        NavigationView{
            
            VStack{
                
                ZStack{
                    Circle()
                        .fill(Color(hue: 1.0, saturation: 0.0, brightness: 0.867))
                        .frame(width: 155)
                    
                    Image(systemName: "camera.fill").resizable().frame(width: 50, height: 50)
                }
                Form {
                    Section(header: Text("Team Information")
                        ) {
                        HStack{
                            Text("Team Name: ")
                            TextField("Name",text: $name)
                        }.padding(.bottom, 7.0)
                        
                        HStack{
                            Text("Theme: ")
                            TextField("Theme",text: $theme)
                        }.padding(.bottom, 7.0)
                        
                        HStack{
                            Text("Problem Statement: ")
                            TextField("Statement",text: $problem)
                        }.padding(.bottom, 7.0)
                   
                        HStack{
                            Text("Member Count:")
                            Picker("", selection: $member_count) {
                                ForEach(1...6, id: \.self) { count in
                                                            Text("\(count)").tag(count - 1)
                                                        }
                                                        Text("Other").tag(6)
                            }
                        }.padding(.bottom, 7.0)
                        
                    }
                       
                        
                    Section(header: Text("Members Information")) {
                        ForEach(0..<member_count+1, id: \.self){index in
                            VStack{
                                Text("Position \(index + 1):")
                                TextField("Tech Stack",text: $techstack)
                                TextField("Details",text: $details)
                            }
                        }
                        
                    }
                    
                }.contentMargins(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/, 5)
                
                Button(action: gohacks) {
                    Text("Publish Team")
                }.buttonStyle(.bordered)
                    .tint(.blue)
            }.navigationBarTitleDisplayMode(.inline).navigationTitle("Create Your Team")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button (action: goHackLand){
                            Image(systemName: "chevron.backward")
                        }
                    }
                }.padding(.all, 7)
        }
        
    }
}

#Preview {
    Team_create()
}
