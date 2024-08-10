//
//  FormTextFieldView.swift
//  Restaurants
//
//  Created by Artur Reiner on 19.08.24.
//

import SwiftUI

struct FormTextFieldView: View {
    
    @Binding var restaurantName: String
    var label: String
    var placeholder: String
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .textCase(.uppercase)
                .font(.system(.headline, design: .rounded))
                .foregroundStyle(Color(.darkGray))
            TextField(placeholder, text: $restaurantName)
                .font(.system(.body, design: .rounded))
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 10)
        }
    }
}

#Preview {
    FormTextFieldView(restaurantName: .constant(""), label: "Name", placeholder: "Fill in the restaurant name")
}
