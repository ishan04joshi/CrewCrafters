//
//  Home.swift
//  CrewCrafters
//
//  Created by user1 on 09/12/23.
//

import SwiftUI

struct Home: View {

    var body: some View {
        NavigationView{
            ScrollView{
                HStack(){
                    Spacer()
                    Image("user")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                    Spacer()
                    Text("Hello, Elon Musk!")
                        .font(.title)
                        .fontWeight(.semibold)
                    Spacer()
                    Spacer()
                }.padding(.top, 30.0)
                
                
                Text("Trending Hackathon")
                    .padding(.top, 30.0)
                    .titleStyle()
                ScrollView (.horizontal) {
                    HStack (spacing: 15) {
                        ForEach(0..<3){_ in
                            Image("hackathon_poster")
                                .resizable()
                                .frame(width: 250, height: 150)
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(15)
                            Image("hackathon_poster1")
                                .resizable()
                                .frame(width: 250, height: 150)
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(15)
                        }
                    }
                }
                .padding([.leading, .bottom, .trailing])
                
                Text("Applied Hackathon")
                    .titleStyle()
                VStack{
                    
                    ForEach(0..<2){_ in
                        VStack (alignment: .leading) {
                            HStack{
                                Image(systemName: "person")
                                Text("Elon Musk")
                                    .font(.callout)
                                    .fontWeight(.bold)
                                Spacer()
                                Text("X")
                                    .fontWeight(.heavy)
                                Spacer()
                                HStack{
                                    
                                    Text("Amaze Team")
                                        .font(.callout)
                                        .fontWeight(.semibold)
                                    Image(systemName: "person.3.fill")
                                }
                                
                            }
                            .padding([.top, .leading, .trailing], 7.0)
                            
                            
                            Image("hackathon_poster")
                                .resizable()
                                .frame(width: 355, height: 157)
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(15)
                            
                            
                            
                            
                            Text("Just applied in Amaze Team for Ocean Hackathon as Web Developer")
                                .fontWeight(.semibold)
                        }
                        Divider()
                        VStack (alignment: .leading) {
                            
                            HStack{
                                Image(systemName: "person")
                                Text("Elon Musk")
                                    .font(.callout)
                                    .fontWeight(.bold)
                                Spacer()
                                Text("X")
                                    .fontWeight(.heavy)
                                Spacer()
                                HStack{
                                    
                                    Text("Amaze Team")
                                        .font(.callout)
                                        .fontWeight(.semibold)
                                    Image(systemName: "person.3.fill")
                                }
                                
                            }
                            .padding([.top, .leading, .trailing], 7.0)
                            
                            Image("hackathon_poster1")
                                .resizable()
                                .frame(width: 355, height: 157)
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(15)
                            
                            Text("Just applied in Amaze Team for Ocean Hackathon as Web Developer").fontWeight(.semibold)
                        }
                        Divider()
                    }
                }
                .padding([.leading, .bottom, .trailing])
                
                
            }.navigationTitle("Home")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack
                        {
                            Button(action: {}){
                                NavigationLink(destination: Login()){
                                    Image(systemName: "person.crop.circle")
                                    
                                }
                            }
                        }
                    }
                }
        }
    }
}
func goHome() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: ContentView())
        window.makeKeyAndVisible()
    }
}


#Preview {
    Home()
}
