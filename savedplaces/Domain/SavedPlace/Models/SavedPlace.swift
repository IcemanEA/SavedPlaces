//
//  SavedPlace.swift
//  savedplaces
//
//  Created by Alexander Zhuchkov on 05.09.2024.
//

import Foundation



struct SavedPlace: Identifiable {

    static var `default`: SavedPlace {
        return SavedPlace(id: 0, name: "TEST", address: .init(country: "TEST"))
    }
    
    let id: Int
    var name: String?
    var address: Address

    init(id: Int, name: String?, address: Address) {
        self.id = id
        self.name = name
        self.address = address
    }
}

struct Address {
    var country: String?
    var city: String?
    var street: String?
    var houseNumber: String?
}

