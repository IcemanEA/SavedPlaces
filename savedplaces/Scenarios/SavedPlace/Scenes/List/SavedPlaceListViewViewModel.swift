//
//  SavedPlaceListViewViewModel.swift
//  savedplaces
//
//  Created by Alexander Zhuchkov on 05.09.2024.
//

enum State: String, CaseIterable {
    case idle
    case loading
    case loaded
}

import Combine

// MARK: - ViewModel Type
protocol SavedPlaceListViewViewModelType: AnyObject {
    
    // MARK: - Properties
    var statePublisher: Published<State>.Publisher { get }
    
    // MARK: - Methods
    func selectSavedPlace(at index: Int)
    func changeState()
}


// MARK: - ViewModel
class SavedPlaceListViewViewModel {
    
    // MARK: - Output
    var didSelectSavedPlace: ((SavedPlace) -> Void)?
    
    // MARK: - Internal Properties
    private let repository: SavedPlaceRepository
    @Published var state: State = .idle
    var statePublisher: Published<State>.Publisher { $state }
    
    // MARK: - Properties
    
    // MARK: - Initialization
    init(repository: SavedPlaceRepository) {
        self.repository = repository
    }
    
    // MARK: - Methods
}


// MARK: - Public API
extension SavedPlaceListViewViewModel: SavedPlaceListViewViewModelType {
    

    func selectSavedPlace(at index: Int) {
        let savedPlace = repository.items[index]
        didSelectSavedPlace?(savedPlace)
    }
    
    func changeState() {
        state = State.allCases.randomElement()!
    }
}

