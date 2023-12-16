//
//  TextStyles.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 15/12/23.
//

import SwiftUI

struct TitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.leading, .bottom, .trailing])
    }
}

struct ThemeListStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .font(.subheadline)
            .background(Color.gray.opacity(0.4))
            .cornerRadius(15)
    }
}


extension View {
    func titleStyle() -> some View {
        self.modifier(TitleStyle())
    }
    
    func themelistStyle() -> some View {
        self.modifier(ThemeListStyle())
    }
}
