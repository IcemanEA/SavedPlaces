//
//  SavedPlaceViewController+SavedPlaceViewModel.swift
//  savedplaces
//
//  Created by Alexander Zhuchkov on 05.09.2024.
//

import Foundation

// MARK: - SavedPlaceViewModel
extension SavedPlaceListViewController {
    struct ViewModel {
        
        // MARK: - Output properties
        var title: String? {
            return savedPlace.name
        }
        
        var subtitle: String? {
            var address = ""
            
            if let string = savedPlace.address.country {
                address += string
            }
            
            if let string = savedPlace.address.city {
                address = address == "" ? string : ", " + string
            }
            
            if let string = savedPlace.address.street {
                address = address == "" ? string : ", " + string
            }
            
            if let string = savedPlace.address.houseNumber {
                address = address == "" ? string : ", " + string
            }
            if address == "" {
                return nil
            } else {
                return address
            }
        }
        
        // MARK: - Internal Properties
        private let savedPlace: SavedPlace
        
        // MARK: - Initialization
        init(savedPlace: SavedPlace) {
            self.savedPlace = savedPlace
        }
    }
}

// MARK: - Equatable
extension SavedPlaceListViewController.ViewModel: Equatable {
    static func == (lhs: SavedPlaceListViewController.ViewModel, rhs: SavedPlaceListViewController.ViewModel) -> Bool {
        lhs.savedPlace.name == rhs.savedPlace.name
    }
}

// MARK: - Hashable
extension SavedPlaceListViewController.ViewModel: Hashable {}
