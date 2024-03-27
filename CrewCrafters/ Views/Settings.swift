import SwiftUI
import FirebaseAuth
struct Settings: View {
    @State private var searchText = ""
    @EnvironmentObject var userViewModel: UserViewModel // Assuming you have a reference to UserViewModel
    @State private var isLoggedIn = true // State variable to control navigation
    
    
    var body: some View {
        VStack {
            List {
                ForEach(SettingsViewModel().setting) { section in
                    Section(header: Text(section.header)
                        .font(.subheadline)
                        .fontWeight(.bold)) {
                            ForEach(section.settings) { setting in
                                if setting.title == "Log Out" {
                                    Button(action: {
                    
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
