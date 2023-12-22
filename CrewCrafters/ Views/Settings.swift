//
//  Settings.swift
//  CrewCrafters
//
//  Created by user1 on 09/12/23.
//

import SwiftUI

struct Settings: View {
    @State var searchText = ""
    @ObservedObject var viewModel = SettingsViewModel()
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.setting) { section in
                    Section(header: Text(section.header)
                        .font(.subheadline)
                        .fontWeight(.bold)) {
                            ForEach(section.settings) { setting in
                                HStack {
                                    Image(systemName: setting.imageName)
                                        .padding(.trailing, 20.0)
                                    Text(setting.title)
                                }
                            }
                        }
                }
            }
            .padding(.all, 7)
        }.navigationTitle("Settings")
            .searchable(text: $searchText)
    }
}


#Preview {
    Settings()
}
