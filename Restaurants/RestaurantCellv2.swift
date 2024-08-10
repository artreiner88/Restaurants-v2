//
//  RestaurantCellv2.swift
//  Restaurants
//
//  Created by Artur Reiner on 10.08.24.
//

import SwiftUI

struct RestaurantCellv2: View {
    
    @Binding var restaurant: Restaurant
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipShape(.rect(cornerRadius: 10))
            
            VStack(alignment: .leading) {
                Text(restaurant.name)
                    .font(.system(.title2, design: .rounded))
                Text("Type")
                    .font(.system(.body, design: .rounded))
                Text("Location")
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
}

#Preview {
    RestaurantCellv2(restaurant: .constant(Restaurant(name: "Teakha", type: "Tea House", location: "Shop B, 18 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phone: "354-243523", description: "Take a moment to stop and smell tealeaves! We are about the community, our environment, and all things created by the warmth of our hands. We open at 11 AM, and close at 7 PM. At teakha, we sell only the best single-origin teas sourced by our sister company Plantation directly from small tea plantations. The teas are then either cooked to perfection with milk in a pot or brewed.", image: "teakha", isFavorite: false)))
}
