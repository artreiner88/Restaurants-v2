//
//  RestaurantDetailView.swift
//  Restaurants
//
//  Created by Artur Reiner on 10.08.24.
//

import SwiftUI

struct RestaurantDetailView: View {
    
    @Binding var restaurant: Restaurant
    @State private var showReviewView = false
    
    var body: some View {
        ScrollView {
            VStack {
                Image(restaurant.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 450)
                    .overlay {
                        Image(systemName: restaurant.isFavorite ? "heart.fill" : "heart")
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
                            .padding()
                            .font(.system(size: 30))
                            .foregroundStyle(restaurant.isFavorite ? .yellow : .white)
                            .padding(.top, 40)
                        
                        HStack(alignment: .bottom) {
                            VStack(alignment: .leading, spacing: 5) {
                                Text(restaurant.name)
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                Text(restaurant.type)
                                    .font(.system(.headline, design: .rounded))
                                    .padding(5)
                                    .background(.black)
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
                            .foregroundStyle(.white)
                            .padding()
                            
                            if let rating = restaurant.rating, !showReviewView {
                                Image(rating.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60)
                                    .padding([.bottom, .trailing])
                                    .transition(.scale)
                            }
                        }
                        .animation(.spring(response: 0.2, dampingFraction: 0.3, blendDuration: 0.3), value: restaurant.rating)
                    }
                
                Text(restaurant.description)
                    .padding()
                
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("ADDRESS:")
                            .font(.system(.headline, design: .rounded))
                        Text(restaurant.location)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading) {
                        Text("PHONE:")
                            .font(.system(.headline, design: .rounded))
                        Text(restaurant.phone)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal)
                
                NavigationLink {
                    MapView(location: restaurant.location, interactionModes: [.all])
                        .toolbarBackground(.hidden, for: .navigationBar)
                        .edgesIgnoringSafeArea(.all)
                } label: {
                    MapView(location: restaurant.location, interactionModes: [])
                        .frame(height: 250)
                        .clipShape(.rect(cornerRadius: 10))
                        .padding()
                }
                
                Button {
                    showReviewView.toggle()
                } label: {
                    Text("Rate it")
                        .font(.system(.title2, design: .rounded))
                        .fontWeight(.semibold)
                        .frame(minWidth: 0, maxWidth: .infinity)
                }
                .tint(Color(uiColor: .systemOrange))
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .padding(.horizontal)
                .padding(.bottom, 50)
                
            }
            .toolbarBackground(.hidden, for: .navigationBar)
        }
        .ignoresSafeArea()
        .scrollIndicators(.hidden)
        .sheet(isPresented: $showReviewView, content: {
            ReviewView(restaurant: restaurant)
        })
    }
}

#Preview {
    RestaurantDetailView(restaurant: .constant(Restaurant(name: "Teakha", type: "Tea House", location: "Shop B, 18 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phone: "354-243523", description: "Take a moment to stop and smell tealeaves! We are about the community, our environment, and all things created by the warmth of our hands. We open at 11 AM, and close at 7 PM. At teakha, we sell only the best single-origin teas sourced by our sister company Plantation directly from small tea plantations. The teas are then either cooked to perfection with milk in a pot or brewed.", image: "teakha", isFavorite: false)))
}
