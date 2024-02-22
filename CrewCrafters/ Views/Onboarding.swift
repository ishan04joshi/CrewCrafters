import SwiftUI

struct Onboarding: View {
    @EnvironmentObject private var onboardingViewModel: OnboardingViewModel
    @State private var isActive: Bool = false
    
    var body: some View {
        NavigationView {
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
                // Simulate splash screen delay for 2 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.isActive = true
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

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
