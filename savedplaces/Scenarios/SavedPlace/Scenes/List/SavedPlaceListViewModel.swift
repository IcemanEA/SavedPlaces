//
//  SavedPlaceViewViewModel.swift
//  savedplaces
//
//  Created by Alexander Zhuchkov on 05.09.2024.
//

// MARK: - ViewModel Type
protocol SavedPlaceListViewModelType: AnyObject {
    
    var items: [SavedPlaceListViewController.ViewModel] { get }
    
    func fullRefresh()
    
    func getItem(at index: Int) -> SavedPlace
    func deleteItem(at index: Int)
}


// MARK: - ViewModel
final class SavedPlaceListViewModel {
    
    // MARK: - Output
    var items: [SavedPlaceListViewController.ViewModel] = []
    
    // MARK: - Internal Properties
    private let repository: SavedPlaceRepositoryType
    
    // MARK: - Properties
    
    // MARK: - Initialization
    init(repository: SavedPlaceRepositoryType) {
        self.repository = repository
        
        self.fullRefresh()
    }
}


// MARK: - Public API
extension SavedPlaceListViewModel: SavedPlaceListViewModelType {
    
    func fullRefresh() {
        items = repository.items.map({ SavedPlaceListViewController.ViewModel(savedPlace: $0) })
    }
    
    func getItem(at index: Int) -> SavedPlace {
        repository.items[index]
    }
    
    func deleteItem(at index: Int) {
        items.remove(at: index)
        repository.deleteItem(at: index)
    }
}
