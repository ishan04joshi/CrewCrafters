//
//  Apply_form.swift
//  CrewCrafters
//
//  Created by user1 on 19/01/24.
//

import SwiftUI

struct Apply_form: View {
    @State var showingDetail = false
    @State var shareProfile = true
    @State var name: String = ""
    @State var theme: String = ""
    @State var problem: String = ""
    @State var techstack: String = ""
    @State var details: String = ""
    @State private var role = "Web Dev"
        let position = ["Web Dev", "App Dev", "Cloud Engg.", "AI Engg.", "Backend Dev"]
    @State var n: Int = 1
    @StateObject private var viewModel = OrganiserCreateHackViewModel()
    var body: some View {
        
        
        VStack{
            Form {
                Section(header: Text("Personal Infor")
                ) {
                    HStack{
                        Text("Name: ")
                        TextField("Name",text: $name)
                    }.padding(.bottom, 7.0)
                    
                    HStack{
                        Text("E-mail: ")
                        TextField("email",text: $theme)
                    }.padding(.bottom, 7.0)
                    
                    HStack{
                        Text("Phone No.: ")
                        TextField("Statement",text: $problem)
                    }.padding(.bottom, 7.0)
                    
                    
                    
                }
                
                
                Section() {
    
                    HStack{
                            Toggle("Share Profile", isOn: $shareProfile)
                        }.padding(.bottom, 7.0)
                    HStack{
                        Text("GitHub Link: ")
                        TextField("Statement",text: $problem)
                    }.padding(.bottom, 7.0)
                    HStack{

                        Picker("Prefered Position: ", selection: $role) {
                                    ForEach(position, id: \.self) {
                                        Text($0)
                                    }
                                }
                    }.padding(.bottom, 7.0)
                    
                    VStack(alignment: .leading){
                        Text("How are you suitable for this role:")
                        TextField("Brief discription",text: $problem)
                    }.padding(.bottom, 7.0)
                    
                    VStack(alignment: .leading){
                        Text("Previous Achievments")
                        TextField("Give upto 3",text: $problem)
                    }.padding(.bottom, 7.0)
                    VStack(alignment: .leading){
                        Text("Resume: ")
                        //put button here
                
                    }.padding(.bottom, 7.0)
                    
                }
                
                
            }.contentMargins(.horizontal, 5)
            
            NavigationLink(destination: Team_info(name: name, image: "hackathon_poster")){
                Text("Apply")}
            .buttonStyle(NavigationButton())
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Create Your Team")
        .padding(.all, 7)
    }
}

#Preview {
    Apply_form()
}
