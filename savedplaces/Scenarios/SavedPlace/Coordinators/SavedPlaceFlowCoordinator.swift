//
//  SavedPlaceFlowCoordinator.swift
//  savedplaces
//
//  Created by Alexander Zhuchkov on 05.09.2024.
//

import UIKit
import LaudoKit

class SavedPlaceFlowCoordinator: Coordinator {
    
    // MARK: - Internal
    private let navigationController: UINavigationController
    
    // MARK: - Initialization
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Overrides
    override func start() {
        showSavedPlace()
    }
    
    // MARK: - Methods
    private func showSavedPlace() {
        
        // Initialize ViewModel
        let viewModel = SavedPlaceViewViewModel(repository: SavedPlaceRepository())
        
        // Initialize ViewController
        let viewController = SavedPlaceViewController(viewModel: viewModel)
        
        //
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
