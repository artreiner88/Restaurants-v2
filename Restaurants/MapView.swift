//
//  MapView.swift
//  Restaurants
//
//  Created by Artur Reiner on 11.08.24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var location: String
    var interactionModes: MapInteractionModes
    @State private var position: MapCameraPosition = .automatic
    @State private var markerLocation = CLLocation()
    @State private var isError = false
    
    private func convertAddress(location: String) {
        
        // Get location
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(location) { placemarks, error in
            if let _ = error {
                isError.toggle()
                return
            }
            
            guard let placemarks = placemarks, let location = placemarks[0].location else {
                return
            }
            
            let region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.0015, longitudeDelta: 0.0015))
            
            position = .region(region)
            markerLocation = location
        }
    }
    
    var body: some View {
        Map(position: $position, interactionModes: interactionModes) {
            Marker("Here", coordinate: markerLocation.coordinate)
                .tint(.red)
        }
        .task {
            convertAddress(location: location)
        }
        .alert("Ooops", isPresented: $isError) {
            
        } message: {
            Text("Sorry, there was a location derermination error")
        }
    }
}

#Preview {
    MapView(location: "54 Frith Street London W1D 4SL United Kingdom", interactionModes: [.all])
}
