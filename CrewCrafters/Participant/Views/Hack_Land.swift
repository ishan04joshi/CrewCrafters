//
//  Hack_Land.swift
//  CrewCrafters
//
//  Created by user1 on 09/12/23.
//

import SwiftUI

struct Hack_Land: View {
    let hackathonIndex: Int
    @EnvironmentObject var hackathonViewModel: HackathonViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        if hackathonIndex < hackathonViewModel.hackathons.count {
            let hackathon = hackathonViewModel.hackathons[hackathonIndex]
            
            ScrollView{
                VStack(alignment: .leading) {
                    
                    Image(uiImage: hackathon.hackathonPoster ?? UIImage(named: "default_hackathon_poster")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 350, height: 200)
                        .cornerRadius(20.0)
                        .padding([.leading, .bottom, .trailing])
                    
                    if userViewModel.userRole == "Participant"{
                        HStack{
                            Spacer()
                            Spacer()
                            
                            NavigationLink(destination: Hack_Teams(hackathonIndex: hackathonViewModel.hackathons.firstIndex(of: hackathon) ?? 0)){
                                Text("Join a Team")
                                    .foregroundColor(.blue)
                                
                            }
                            .buttonStyle(.bordered)
                            .tint(.blue)
                            Spacer()
                            NavigationLink(destination: Team_create(hackathonIndex: hackathonViewModel.hackathons.firstIndex(of: hackathon) ?? 0)){
                                Text("Make a Team")
                                    .foregroundColor(.blue)
                            }
                            .buttonStyle(.bordered)
                            .tint(.blue)
                            Spacer()
                            Spacer()
                        }
                        .padding(.bottom)
                    }
                    
                    Text("About")
                        .titleStyle()
                    
                    Text(hackathon.about)
                        .font(.body)
                        .lineLimit(5)
                        .padding([.leading, .bottom, .trailing])
                    
                    Text("Themes")
                        .titleStyle()
                    
                    let themes = ["Machine Learning", "Data Science", "Blockchain", "Internet of Things", "Cybersecurity", "Web Development"]

                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150, maximum: 300), spacing: 10)], alignment: .leading, spacing: 10.0) {
                        ForEach(themes, id: \.self) { theme in
                            Text(theme)
                                .frame(maxWidth: .infinity)
                                .themelistStyle()
                        }
                    }
                    .padding()

                    
                    Text("Partners")
                        .titleStyle()
                    
                    HStack {
                        ForEach(0..<3) { index in
                            HStack {
                                Spacer()
                                Image(uiImage: UIImage(named: "partner\(index + 1)")!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 85.0, height: 85.0)
                                Spacer()
                            }
                        }
                    }
                    
                    Text("Timeline")
                        .titleStyle()
                    
                    VStack(alignment:.leading, spacing: 10) {
                        HStack(spacing: 20){
                            Circle()
                                .fill(.gray)
                                .frame(width: 15, height: 15)
                                .background(
                                    Circle()
                                        .stroke(.gray, lineWidth: 1)
                                        .padding(-3)
                                )
                            Text("\(formatDate(from: hackathon.startDate))")
                                .font(.headline)
                                .fontWeight(.semibold)
                        }
                        Rectangle()
                            .fill(.gray)
                            .frame(width: 4, height: 20)
                            .cornerRadius(1.5)
                            .padding(.leading, 5)
                        HStack(spacing: 20){
                            Circle()
                                .fill(.gray)
                                .frame(width: 15, height: 15)
                                .background(
                                    Circle()
                                        .stroke(.gray, lineWidth: 1)
                                        .padding(-3)
                                )
                            Text("\(formatDate(from: hackathon.endDate))")
                                .font(.headline)
                                .fontWeight(.semibold)
                        }
                    }
                    .padding([.leading, .bottom])
                    
                    
                    Text("Prizes")
                        .titleStyle()
                    
                    VStack(alignment: .leading, spacing: 15.0) {
                        PrizeView(prizeTitle: "First Place", prize: "\(hackathon.prize[0])")
                        PrizeView(prizeTitle: "Second Place", prize: "\(hackathon.prize[1])")
                        PrizeView(prizeTitle: "Third Place", prize: "\(hackathon.prize[2])")
                    }
                    .padding([.leading, .bottom, .trailing])
                }
            }
            .navigationTitle("\(hackathon.name)")
            .padding(.all, 7)
        }
    }
}

struct PrizeView: View {
    let prizeTitle: String
    let prize: String
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "trophy.fill")
                .foregroundStyle(Color.gray)
                .font(.largeTitle)
            VStack(alignment: .leading) {
                Text(prizeTitle)
                    .font(.headline)
                    .fontWeight(.semibold)
                Text(prize)
                    .font(.body)
            }
        }
    }
}

//struct HackLand_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            Hack_Land(hackathonIndex: 0)
//        }
//        .environmentObject(HackathonViewModel())
//    }
//}
