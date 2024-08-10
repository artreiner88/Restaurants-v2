//
//  RestaurantImagePickerView.swift
//  Restaurants
//
//  Created by Artur Reiner on 19.08.24.
//

import SwiftUI

struct RestaurantImagePickerView: View {
    
    @Binding var image: UIImage
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 200)
            .background(Color(.systemGray6))
            .clipShape(.rect(cornerRadius: 10))
            .padding(.bottom)
    }
}

#Preview {
    RestaurantImagePickerView(image: .constant(UIImage(named: "newphoto")!))
}
