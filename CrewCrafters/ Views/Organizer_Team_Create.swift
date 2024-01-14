//
//  Organizer_Team_Create.swift
//  CrewCrafters
//
//  Created by user1 on 14/01/24.
//

import SwiftUI

struct Organizer_Team_Create: View {
    @State var showingDetail = false
    @State var name: String = ""
    @State var theme: String = ""
    @State var problem: String = ""
    @State var techstack: String = ""
    @State var details: String = ""
    @State var member_count: Int = 0
    @State var n: Int = 1
    @State var selectedDate: Date = Date()
    var body: some View {
        
        
        VStack{
            
            Form {
                Section(header: Text("Hackathon Information")
                ) {
                    HStack{
                        Spacer()
                        ZStack{
                            Circle()
                                .fill(Color(hue: 1.0, saturation: 0.0, brightness: 0.867))
                                .frame(width: 155)
                            
                            Image(systemName: "camera.fill").resizable().frame(width: 50, height: 40)
                        }
                        Spacer()
                    }

                    HStack{
                        Text("Hackathon Name: ")
                        TextField("Name",text: $name)
                    }.padding(.bottom, 7.0)
                    
                    HStack{
                        Text("Mode :")
                        TextField("Online/ Offline",text: $theme)
                    }.padding(.bottom, 7.0)
                    
                    HStack{
                        Text("Partners: ")
                        TextField("Statement",text: $problem)
                    }.padding(.bottom, 7.0)
                    
                    HStack{
                        Text("Number of Themes:")
                        Picker("", selection: $member_count) {
                            ForEach(1...6, id: \.self) { count in
                                Text("\(count)").tag(count - 1)
                            }
                            Text("Other").tag(6)
                        }
                    }.padding(.bottom, 7.0)
                    
                }
                
                
                Section(header: Text("Themes Info")) {
                    ForEach(0..<member_count+1, id: \.self){index in
                        VStack(alignment: .leading){
                            Text("Theme \(index + 1)")
                            TextField("Tech Stack",text: $techstack)
                            TextField("Details",text: $details)
                        }
                    }
                    
                }
                Section(header: Text("Timeline")
                ) {
                    HStack{
                        Text("Start Date: ")
                        DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date]).padding(.horizontal).datePickerStyle(.graphical)
                    }.padding(.bottom, 7.0)
                    
                    HStack{
                        Text("End Date: ")
                        DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date]).padding(.horizontal).datePickerStyle(.graphical)
                    }.padding(.bottom, 7.0)
                    
                    
                                        
                }
                Section(header: Text("Prize details")
                ) {
                    HStack{
                        Text("1st prize: ")
                        TextField("Amount",text: $name)
                    }.padding(.bottom, 7.0)
                    
                    HStack{
                        Text("2nd prize: ")
                        TextField("Amount",text: $name)
                    }.padding(.bottom, 7.0)
                    HStack{
                        Text("3rd prize: ")
                        TextField("Amount",text: $name)
                    }.padding(.bottom, 7.0)
                    
                                        
                }
                
                
            }.contentMargins(.horizontal, 5)
            
            NavigationLink(destination: Hack_Land(title: name, image: "hackathon_poster")){
                Text("Publish Hackathon")}
            .buttonStyle(NavigationButton())
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Create Your Team")
        .padding(.all, 7)
    }
}

#Preview {
    Organizer_Team_Create()
}
