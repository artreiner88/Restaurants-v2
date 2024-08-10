//
//  PhotoSource.swift
//  Restaurants
//
//  Created by Artur Reiner on 20.08.24.
//

import Foundation

enum PhotoSource: Identifiable {
    case photoLibrary
    case camera
    
    var id: Int {
        hashValue
    }
}
