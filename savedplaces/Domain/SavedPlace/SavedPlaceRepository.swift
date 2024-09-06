//
//  SavedPlaceRepository.swift
//  savedplaces
//
//  Created by Alexander Zhuchkov on 05.09.2024.
//

import Foundation

class SavedPlaceRepository {
    
    let items: [SavedPlace]
    
    init() {
        self.items = [
            .init(id: 1, name: "Home", address: .init(country: "RUS")),
            .init(id: 2, name: "Coffee", address: .init(country: "UK"))
        ]
        
    }
}
