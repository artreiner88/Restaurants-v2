//
//  FormTextEditorView.swift
//  Restaurants
//
//  Created by Artur Reiner on 19.08.24.
//

import SwiftUI

struct FormTextEditorView: View {
    
    @Binding var restaurantDescription: String
    var label: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .textCase(.uppercase)
                .font(.system(.headline, design: .rounded))
                .foregroundStyle(Color(.darkGray))
            TextEditor(text: $restaurantDescription)
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray5),lineWidth: 1)
                }
                .padding(.horizontal, 10)
        }
    }
}

#Preview {
    FormTextEditorView(restaurantDescription: .constant(""), label: "Descriprion")
}
