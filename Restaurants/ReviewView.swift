//
//  ReviewView.swift
//  Restaurants
//
//  Created by Artur Reiner on 11.08.24.
//

import SwiftUI

struct ReviewView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var isRatingsDisplayed = false
    var restaurant: Restaurant
    
    var body: some View {
        ZStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .ignoresSafeArea()
                .overlay {
                    Color.black
                        .opacity(0.6)
                        .background(.ultraThinMaterial)
                        .ignoresSafeArea()
                }
            
            HStack {
                Spacer()
                VStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 30))
                            .foregroundStyle(.white)
                            .padding()
                    }
                    Spacer()
                }
            }
            
            VStack(alignment: .leading, spacing: 30) {
                ForEach(Rating.allCases, id: \.self) { rating in
                    Image(rating.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80)
                        .opacity(isRatingsDisplayed ? 1.0 : 0)
                        .offset(x: isRatingsDisplayed ? 0 : 1000)
                        .animation(
                            .easeInOut.delay(Double(Rating.allCases.firstIndex(of: rating)!) * 0.05),
                            value: isRatingsDisplayed
                        )
                        .onTapGesture {
                            restaurant.rating = rating
                            dismiss()
                        }
                }
            }
        }
        .onAppear {
            isRatingsDisplayed.toggle()
        }
    }
}

#Preview {
    ReviewView(restaurant: Restaurant(name: "Upstate", type: "American", location: "95 1st Ave New York, NY 10003", phone: "343-233221", description: "The absolute best seafood place in town. The atmosphere here creates a very homey feeling. We open at 5 PM, and close at 10:30 PM.", image: "upstate", isFavorite: false))
}
