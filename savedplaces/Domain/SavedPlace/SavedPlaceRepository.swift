//
//  SavedPlaceRepository.swift
//  savedplaces
//
//  Created by Alexander Zhuchkov on 05.09.2024.
//

import Foundation

protocol SavedPlaceRepositoryType {
    var items: [SavedPlace] { get }
    
    func addItem(_ item: SavedPlace)
    func deleteItem(at index: Int)
}

final class SavedPlaceRepository: SavedPlaceRepositoryType {
    
    // MARK: - Private properties
    private(set) var items: [SavedPlace]
    
    // MARK: - Initialization
    init() {
        self.items = [
            .init(id: 1, name: "Home", address: .init(country: "RUS")),
            .init(id: 2, name: "Coffee", address: .init(country: "UK"))
        ]
        
    }
    
    // MARK: - Public Methods
    func addItem(_ item: SavedPlace) {
        items.append(item)
    }
    
    func deleteItem(at index: Int) {
        items.remove(at: index)
    }
}
