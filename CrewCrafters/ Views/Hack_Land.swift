//
//  Hack_Land.swift
//  CrewCrafters
//
//  Created by user1 on 09/12/23.
//

import SwiftUI

struct Hack_Land: View {
    var title: String
    var image: String
    @State var showingDetail = false
    @ObservedObject var viewModel = HackLandViewModel()
    
    var body: some View {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 360)
                        .cornerRadius(20.0)
                        .padding([.leading, .bottom, .trailing])
                    
                    HStack{
                        Spacer()
                        Spacer()
                        
                        Button(action: {print("")}){
                            NavigationLink(destination: Hack_teams(hack: title, image: image)){
                                Text("Join a Team")
                                    .foregroundColor(.blue)
                            }
                        }.buttonStyle(.bordered)
                            .tint(.blue)
                        Spacer()
                        Button(action: {print("")}){
                            NavigationLink(destination: Team_create()){
                                Text("Make a Team")
                                    .foregroundColor(.blue)
                            }
                        }.buttonStyle(.bordered)
                            .tint(.blue)
                        
                        Spacer()
                        Spacer()
                    }
                    .padding(.bottom)
                    
                    Text("About")
                        .titleStyle()
                    
                    Text("The Ambassadors perceive the sea as a field of innovation that must be appropriated but also made known and protected. They are by our side and award the teams on the podium of the Grand Finale.")
                        .font(.body)
                        .lineLimit(5)
                        .padding([.leading, .bottom, .trailing])
                    
                    Text("Themes")
                        .titleStyle()
                    
                    VStack(alignment: .leading, spacing: 10.0) {
                        ForEach(viewModel.themeItems){ item in
                            Text(item.title)
                                .themelistStyle()
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 0))
                    
                    Text("Partners")
                        .titleStyle()
                    
                    HStack{
                        Spacer()
                        Image("partner1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 85.0, height: 85.0)
                        Spacer()
                        Spacer()
                        Image("partner2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 85.0, height: 85.0)
                        Spacer()
                        Spacer()
                        Image("partner3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 85.0, height: 85.0)
                        Spacer()
                    }
                    
                    Text("Timeline")
                        .titleStyle()
                    
                    ForEach(viewModel.timelineItems) { item in
                        HStack(alignment: .top, spacing: 20){
                            VStack(spacing: 10) {
                                Circle()
                                    .fill(.gray)
                                    .frame(width: 15, height: 15)
                                    .background(
                                        Circle()
                                            .stroke(.gray, lineWidth: 1)
                                            .padding(-3)
                                    )
                                Rectangle()
                                    .fill(.gray)
                                    .frame(width: 3)
                            }
                            .frame(width: .infinity, alignment: .leading)
                            .padding(.leading)
                            VStack{
                                HStack(alignment: .top, spacing: 10){
                                    VStack(alignment: .leading, spacing: 12){
                                        Text(item.title)
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                        Text(item.desc)
                                            .font(.body)
                                            .lineLimit(1)
                                    }
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                Color.gray.opacity(0.2)
                                    .cornerRadius(20)
                            )
                        }
                        .padding([.trailing, .bottom])
                    }
                    
                    Text("Prizes")
                        .titleStyle()
                    
                    VStack(spacing: 15.0){
                        HStack(alignment: .top) {
                            Image(systemName: "trophy.fill")
                                .foregroundStyle(Color.gray)
                                .font(.largeTitle)
                            VStack(alignment: .leading){
                                Text("First Place")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                Text("₹7,500 \n Swag")
                                    .font(.body)
                            }
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        HStack(alignment: .top) {
                            Image(systemName: "trophy.fill")
                                .foregroundStyle(Color.gray)
                                .font(.largeTitle)
                            VStack(alignment: .leading){
                                Text("Second Place")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                Text("₹5,500 \n Swag")
                                    .font(.body)
                            }
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        HStack(alignment: .top) {
                            Image(systemName: "trophy.fill")
                                .foregroundStyle(Color.gray)
                                .font(.largeTitle)
                            VStack(alignment: .leading){
                                Text("Third Place")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                Text("₹3,500 \n Swag")
                                    .font(.body)
                            }
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    .padding([.leading, .bottom, .trailing])
                    
                    
                }
                
            }
            .navigationTitle("\(title) Hackathon")
            .padding(.all, 7)
        }
    }

#Preview {
    Hack_Land( title: String(), image: String("hackathon_poster"))
}
