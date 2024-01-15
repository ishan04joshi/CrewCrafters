//
//  CameraButton.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 15/01/24.
//

import SwiftUI

struct CameraButton: View {
    @Binding var image: UIImage?
    @State private var isImagePickerPresented: Bool = false
    
    var body: some View {
        HStack {
            if let selectedImage = image {
                Image(uiImage: selectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            else {
                Spacer()
                Circle()
                    .fill(Color(hue: 1.0, saturation: 0.0, brightness: 0.867))
                    .frame(width: 155)
                    .overlay(
                        Image(systemName: "camera.fill")
                            .resizable()
                            .frame(width: 50, height: 40)
                    )
                    .onTapGesture {
                        isImagePickerPresented.toggle()
                    }
                    .sheet(isPresented: $isImagePickerPresented) {
                        ImagePicker(image: $image)
                    }
                Spacer()
            }
        }
    }
}
