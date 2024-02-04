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
    
    var body: some View {
        if hackathonIndex < hackathonViewModel.hackathons.count {
            let hackathon = hackathonViewModel.hackathons[hackathonIndex]
            
            ScrollView{
                VStack(alignment: .leading) {
                    
                    Image(uiImage: hackathon.hackathonPoster ?? UIImage(named: "default_hackathon_poster")!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 360)
                        .cornerRadius(20.0)
                        .padding([.leading, .bottom, .trailing])
                    
                    HStack{
                        Spacer()
                        Spacer()
//                        NavigationLink(destination: Hack_Teams(hackathonIndex: hackathonViewModel.hackathons.firstIndex(of: hackathon) ?? 0),){
//                            Text("Join a Team")
//                                .foregroundColor(.blue)
//                            
//                        }
                        .buttonStyle(.bordered)
                        .tint(.blue)
                        Spacer()
                        NavigationLink(destination: Team_create()){
                            Text("Make a Team")
                                .foregroundColor(.blue)
                        }
                        .buttonStyle(.bordered)
                        .tint(.blue)
                        Spacer()
                        Spacer()
                    }
                    .padding(.bottom)
                    
                    
                    Text("About")
                        .titleStyle()
                    
                    Text(hackathon.about)
                        .font(.body)
                        .lineLimit(5)
                        .padding([.leading, .bottom, .trailing])
                    
                    Text("Themes")
                        .titleStyle()
                    
                    VStack(alignment: .leading, spacing: 10.0) {
                        ForEach(hackathon.themes, id: \.self) { theme in
                            Text(theme)
                                .themelistStyle()
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 0))
                    
                    Text("Partners")
                        .titleStyle()
                    
                    HStack{
                        ForEach(hackathon.partners, id: \.self) { partner in
                            Spacer()
                            Image(uiImage: partner)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 85.0, height: 85.0)
                            Spacer()
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
                        PrizeView(prizeTitle: "First Place", prize: "₹\(hackathon.prize1)")
                        PrizeView(prizeTitle: "Second Place", prize: "₹\(hackathon.prize2)")
                        PrizeView(prizeTitle: "Third Place", prize: "₹\(hackathon.prize3)")
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
