//
//  Rating.swift
//  Restaurants
//
//  Created by Artur Reiner on 11.08.24.
//

import Foundation

enum Rating: CaseIterable {
    case awesome
    case good
    case okay
    case bad
    case terrible
    
    var image: String {
        switch self {
        case .awesome:
            return "love"
        case .good:
            return "smile"
        case .okay:
            return "neutral"
        case .bad:
            return "sad"
        case .terrible:
            return "poop"
        }
    }
}
