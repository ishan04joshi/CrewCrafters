import SwiftUI
import FirebaseAuth

struct Onboarding: View {
    @State private var isActive: Bool = false
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        Group {
            if let _ = Auth.auth().currentUser {
                // User is signed in, navigate to the appropriate view
                getDestinationView()
            } else {
                // User is not signed in, show the image screen
                VStack {
                    Spacer()
                    Image("CrewCrafter")
                        .resizable()
                        .frame(width: 250, height: 250)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(15)
                    Spacer()
                }
                .padding()
                .onAppear {
                    // Continue with onboarding
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isActive = true // Navigate to Login
                    }
                }
                .background(
                    NavigationLink(
                        destination: Login(),
                        isActive: $isActive
                    ) {
                        EmptyView()
                    }
                    .navigationBarHidden(true)
                )
            }
        }
    }
    
    @ViewBuilder
    private func getDestinationView() -> some View {
        switch userViewModel.userRole {
            case "Admin":
                OrganiserTabView()
            case "Organizer":
                OrganiserTabView()
            case "Participant":
                MainTabView()
            default:
                Login()
        }
    }
}

//struct Onboarding_Previews: PreviewProvider {
//    static var previews: some View {
//        Onboarding()
//    }
//}
