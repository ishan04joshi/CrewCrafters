import SwiftUI
import UIKit

struct ProfileInputView: View {
    @State private var name = ""
    @State private var bio = ""
    @State private var techStack = ""
    @State private var about = ""
    @State private var profileImage: UIImage?
    @State private var coverImage: UIImage?
    
    @ObservedObject var viewModel: ProfileViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    var body: some View {
        VStack {
            if let profileImage = profileImage {
                Image(uiImage: profileImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            } else {
                Button("Select Profile Photo") {
                    self.presentImagePicker(for: .profile)
                }
            }
            
            if let coverImage = coverImage {
                Image(uiImage: coverImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            } else {
                Button("Select Cover Photo") {
                    self.presentImagePicker(for: .cover)
                }
            }
            
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Bio", text: $bio)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Tech Stack", text: $techStack)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("About", text: $about)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: submitProfile) {
                Text("Submit")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
    
    enum ImageType {
        case profile
        case cover
    }
    
    func presentImagePicker(for type: ImageType) {
        let picker = UIImagePickerController()
        picker.delegate = makeCoordinator()
        picker.sourceType = .photoLibrary
        UIApplication.shared.windows.first?.rootViewController?.present(picker, animated: true, completion: nil)
    }
    
    func submitProfile() {
        // Construct profile object with entered data and images
        let profile = ProfileM(
            coverphotoData: coverImage?.jpegData(compressionQuality: 0.1),
            profilephotoData: profileImage?.jpegData(compressionQuality: 0.1),
            name: name,
            bio: bio,
            techstack: techStack.components(separatedBy: ","),
            achievementsData: [],
            about: about
        )
        
        // Assuming you have a userId available
        viewModel.addNewProfile(profile, userId: "pJ38sosDC4e9TFcKx6qFk5IZwS12") {
            // Handle completion if needed
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ProfileInputView
        
        init(_ parent: ProfileInputView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                // Determine which image is selected
                if picker.sourceType == .photoLibrary {
                    // Profile photo selected
                    parent.profileImage = image
                } else {
                    // Cover photo selected
                    parent.coverImage = image
                }
            }
            
            picker.dismiss(animated: true, completion: nil)
        }
    }
}

struct ProfileInputView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInputView(viewModel: ProfileViewModel())
    }
}
