//
//  Hack_Land.swift
//  CrewCrafters
//
//  Created by user1 on 09/12/23.
//

import SwiftUI

struct Hack_Land: View {
    var body: some View {
        NavigationView { // <1>
            Text("Hello, SwiftUI!")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar { // <2>
                    ToolbarItem(placement: .principal) { // <3>
                        Text("Title")
                            .fontWeight(.bold)
                    }
                }
        }

        NavigationView{
            
            
                VStack{
                    Text("Ocean Hackathon®: data, an event and an international community")
                        .font(.headline)
                    
                    Image("hackathon_poster")
                    
                    Text("The Ambassadors perceive the sea as a field of innovation that must be appropriated but also made known and protected. They are by our side and award the teams on the podium of the Grand Finale.")
                        .font(.headline)
                }
            
        }
    }
}

#Preview {
    Hack_Land()
}
