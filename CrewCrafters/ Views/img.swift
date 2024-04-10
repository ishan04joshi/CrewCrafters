import SwiftUI

struct ImageP: UIViewControllerRepresentable {
    @Binding var posterImage: UIImage?
    let defaultPoster: UIImage?

    @Environment(\.presentationMode) private var presentationMode
    @State private var selectedImage: UIImage? // State variable to hold the selected image

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .photoLibrary
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImageP

        init(parent: ImageP) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.posterImage = image
            }
            parent.presentationMode.wrappedValue.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            if parent.posterImage == nil {
                parent.posterImage = parent.defaultPoster
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
