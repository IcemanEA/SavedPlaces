//
//  SavedPlaceViewController+SavedPlaceViewModel.swift
//  savedplaces
//
//  Created by Alexander Zhuchkov on 05.09.2024.
//

import Foundation

// MARK: - SavedPlaceViewModel
extension SavedPlaceViewController {
    struct SavedPlaceViewModel {
        
        // MARK: - Internal Properties
        private let savedPlace: SavedPlace
        
        // MARK: - Initialization
        init(savedPlace: SavedPlace) {
            self.savedPlace = savedPlace
        }
        
    }
}

// MARK: - SavedPlacePresentable
extension SavedPlaceViewController.SavedPlaceViewModel: SavedPlacePresentable {
    var title: String {
        return savedPlace.name ?? ""
    }
    
    var subtitle: String {
        return ""
    }
}
