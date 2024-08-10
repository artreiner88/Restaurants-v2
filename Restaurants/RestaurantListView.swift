//
//  ContentView.swift
//  Restaurants
//
//  Created by Artur Reiner on 10.08.24.
//

import SwiftUI

struct RestaurantListView: View {
    
    @State private var restaurants = Restaurant.getRestaurants()
    @State private var showNewRestaurantView = false
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach($restaurants, id: \.id) { restaurant in
                    NavigationLink {
                        RestaurantDetailView(restaurant: restaurant)
                    } label: {
                        RestaurantCell(restaurant: restaurant)
                    }
                }
                .onDelete(perform: { indexSet in
                    restaurants.remove(atOffsets: indexSet)
                })
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Restaurants")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showNewRestaurantView.toggle()
                    } label: {
                        Text("Add new")
                            .font(.headline)
                            .foregroundStyle(Color(.systemBlue))
                    }
                    .padding(.horizontal)
                }
            }
        }
        .tint(.white)
        .scrollIndicators(.hidden)
        .sheet(isPresented: $showNewRestaurantView) {
            NewRestaurantView()
        }
    }
}

#Preview {
    RestaurantListView()
}

#Preview("Dark Mode") {
    RestaurantListView()
        .preferredColorScheme(.dark)
}
