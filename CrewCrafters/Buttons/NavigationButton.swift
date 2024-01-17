//
//  NavigationButton.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 29/12/23.
//

import SwiftUI

struct NavigationButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(Color.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(50.0)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .padding(.horizontal)
    }
}

#Preview {
    Button("Navigation Button"){}
        .buttonStyle(NavigationButton())
        .previewLayout(.sizeThatFits)
}
