//
//  NewRestaurantView.swift
//  Restaurants
//
//  Created by Artur Reiner on 19.08.24.
//

import SwiftUI

struct NewRestaurantView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var restaurantImage = UIImage(named: "newphoto")!
    @State private var showPhotoOptions = false
    @State private var photoSource: PhotoSource?
    
    @State private var restaurantName = ""
    @State private var restaurantType = ""
    @State private var restaurantAddress = ""
    @State private var restaurantPhone = ""
    @State private var restaurantDescription = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    RestaurantImagePickerView(image: $restaurantImage)
                        .onTapGesture {
                            showPhotoOptions.toggle()
                        }
                    
                    FormTextFieldView(restaurantName: $restaurantName, label: "Name", placeholder: "Fill in the restaurant name")
                    
                    FormTextFieldView(restaurantName: $restaurantType, label: "Name", placeholder: "Fill in the restaurant type")
                    
                    FormTextFieldView(restaurantName: $restaurantAddress, label: "Name", placeholder: "Fill in the restaurant address")
                    
                    FormTextFieldView(restaurantName: $restaurantPhone, label: "Name", placeholder: "Fill in the restaurant phone")
                    
                    FormTextEditorView(restaurantDescription: $restaurantDescription, label: "Description")
                }
                .padding()
            }
            .navigationTitle("New Restaurant")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.headline)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Save")
                            .font(.headline)
                    }
                }
            }
        }
        .confirmationDialog("Choose your photo source", isPresented: $showPhotoOptions, titleVisibility: .visible) {
            Button {
                photoSource = .camera
            } label: {
                Text("Camera")
            }
            
            Button {
                photoSource = .photoLibrary
            } label: {
                Text("Photo Library")
            }
        }
        .fullScreenCover(item: $photoSource) { source in
            switch source {
            case .photoLibrary:
                ImagePicker(sourceType: .photoLibrary, selectedImage: $restaurantImage)
                    .ignoresSafeArea()
            case .camera:
                ImagePicker(sourceType: .camera, selectedImage: $restaurantImage)
                    .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    NewRestaurantView()
}
