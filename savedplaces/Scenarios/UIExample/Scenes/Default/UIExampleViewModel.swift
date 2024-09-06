//
//  SavedPlaceListViewViewModel.swift
//  savedplaces
//
//  Created by Alexander Zhuchkov on 05.09.2024.
//

import Combine

// MARK: - ViewModel Type
protocol UIExampleViewModelType: AnyObject {
    
    // MARK: - Properties
    var statePublisher: Published<UIExampleState>.Publisher { get }
    
    // MARK: - Methods
    func changeState()
}

// MARK: - ViewModel
final class UIExampleViewModel {
    
    // MARK: - Internal Properties
    @Published var state: UIExampleState = .idle
    var statePublisher: Published<UIExampleState>.Publisher { $state }
    
    // MARK: - Properties
    
    // MARK: - Initialization
    init() {}
    
    // MARK: - Methods
}

// MARK: - Public API
extension UIExampleViewModel: UIExampleViewModelType {
    
    func changeState() {
        state = UIExampleState.allCases.randomElement()!
    }
}
