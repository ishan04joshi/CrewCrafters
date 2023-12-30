//
//  PrimaryButton.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 29/12/23.
//

import SwiftUI

struct PrimaryButton: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .cornerRadius(50)
                .padding(.horizontal)
        }
    }
}

#Preview {
    PrimaryButton(title: "Primary Button"){}
}
