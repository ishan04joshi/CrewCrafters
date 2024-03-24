import SwiftUI
import FirebaseAuth

struct Onboarding: View {
    @State private var isActive: Bool = false
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        Group {
            if userViewModel.currentUser == true {
                fetchUserRoleAndNavigate()
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
    
    func fetchUserRoleAndNavigate() -> some View {
        Group {
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
        .onAppear {
            // Fetch user role
            profileViewModel.fetchProfile(userId: userViewModel.userId)
            userViewModel.getUserRole()
        }
    }
}
