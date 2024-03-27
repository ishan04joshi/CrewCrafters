//
//  chat.swift
//  CrewCrafters
//
//  Created by admin on 28/03/24.
//

import SwiftUI

struct chat: View {
    let teamIndex: Int
    @EnvironmentObject var hackathonViewModel: HackathonViewModel
    @EnvironmentObject var teamViewModel: TeamsViewModel
    @State private var messageText = ""
    var body: some View {
        let team = teamViewModel.teams[teamIndex]
        
        VStack{
            VStack{
                Image(uiImage: team.teamphoto ?? UIImage(named: "team_poster")!)
                    .resizable()
                    .frame(width: 100.0,height: 100.0)
                    .clipShape(Circle())
                    
                VStack(spacing: 4){
                    Text(team.name)
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text("Chat")
                        .font(.body)
                        .fontWeight(.semibold)
                }
                Spacer()
            }
            Spacer()
            
            ZStack(alignment: .trailing){
                TextField ("Message...", text: $messageText, axis: .vertical)
                    .padding (12)
                    .padding(.trailing, 48)
                    .background (Color (.systemGroupedBackground) )
                    .clipShape (Capsule())
                    .font (. subheadline)
                Button(action: {print("send message")}, label: {
                    Text("Send").fontWeight(.semibold)
                }).padding(.horizontal)
            }
        }
    }
}

#Preview {
    chat(teamIndex: 0)
}
