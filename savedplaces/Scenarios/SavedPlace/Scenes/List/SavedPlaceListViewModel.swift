//
//  SavedPlaceViewViewModel.swift
//  savedplaces
//
//  Created by Alexander Zhuchkov on 05.09.2024.
//


// MARK: - ViewModel Type
protocol SavedPlaceListViewModelType: AnyObject {
    
    func deleteItem(at index: Int)
}


// MARK: - ViewModel
final class SavedPlaceListViewModel {
    
    // MARK: - Output
    
    // MARK: - Internal Properties
    private let repository: SavedPlaceRepositoryType
    
    // MARK: - Properties
    
    // MARK: - Initialization
    init(repository: SavedPlaceRepositoryType) {
        self.repository = repository
        
    }
    
    // MARK: - Methods
}


// MARK: - Public API
extension SavedPlaceListViewModel: SavedPlaceListViewModelType {
    func deleteItem(at index: Int) {
        
    }
}

