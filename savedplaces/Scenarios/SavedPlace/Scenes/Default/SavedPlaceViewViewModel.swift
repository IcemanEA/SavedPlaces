//
//  SavedPlaceViewViewModel.swift
//  savedplaces
//
//  Created by Alexander Zhuchkov on 05.09.2024.
//


// MARK: - ViewModel Type
protocol SavedPlaceViewViewModelType: AnyObject {
    
    // MARK: - Properties
    
    // MARK: - Methods
}


// MARK: - ViewModel
class SavedPlaceViewViewModel {
    
    // MARK: - Output
    
    // MARK: - Internal Properties
    private let repository: SavedPlaceRepository
    
    // MARK: - Properties
    
    // MARK: - Initialization
    init(repository: SavedPlaceRepository) {
        self.repository = repository
        
    }
    
    // MARK: - Methods
}


// MARK: - Public API
extension SavedPlaceViewViewModel: SavedPlaceViewViewModelType {
    func deleteItem(at index: Int) {
        
    }
}

