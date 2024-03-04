//
//  Applications.swift
//  CrewCrafters
//
//  Created by user35 on 04/03/24.
//

import SwiftUI

struct Applications: View {
    var body: some View {
        VStack {
            Text("No Applicants Yet")
                .font(.title)
                .padding()
            
            Image(systemName: "person.3")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .padding()
            
            Text("There are currently no applicants for this Position.")
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
        }
    }
}
