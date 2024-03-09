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
                                if setting.title == "Log Out" {
                                    Button(action: {
                                        viewModel.logout()
                                    }) {
                                        HStack {
                                            Image(systemName: setting.imageName)
                                                .padding(.trailing, 20.0)
                                            Text(setting.title)
                                        }
                                    }
                                } else {
                                    HStack {
                                        Image(systemName: setting.imageName)
                                            .padding(.trailing, 20.0)
                                        Text(setting.title)
                                    }
                                }
                            }
                        }
                }
            }
            .padding(.all, 7)
        }
        .navigationTitle("Settings")
        .searchable(text: $searchText)
    }
}
