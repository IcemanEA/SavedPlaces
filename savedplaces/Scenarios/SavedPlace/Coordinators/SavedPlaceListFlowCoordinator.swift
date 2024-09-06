//
//  SavedPlaceListFlowCoordinator.swift
//  savedplaces
//
//  Created by Alexander Zhuchkov on 05.09.2024.
//

import UIKit
import LaudoKit

class SavedPlaceListFlowCoordinator: Coordinator {
    
    // MARK: - Internal Properties
    private let navigationController: UINavigationController
    private var initialViewController: UIViewController?
    
    // MARK: - Initialization
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.initialViewController = navigationController.viewControllers.last
    }
    
    // MARK: - Overrides
    override func start() {
        showSavedPlaceList()
    }
    
    override func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        if viewController === initialViewController {
            // Invoke Finish Handler
            didFinish?(self)
        }
    }
    
    private func finish() {
        if let initialViewController {
            navigationController.popToViewController(initialViewController, animated: true)
        }
        
        didFinish?(self)
    }
    
    // MARK: - Methods
    private func showSavedPlaceList() {
        
        // Initialize ViewModel
        let viewModel = SavedPlaceListViewViewModel(repository: SavedPlaceRepository())
        
        // Install Handlers
        viewModel.didSelectSavedPlace = { [weak self] savedPlace in
            self?.runSavedPlaceDetailFlow(with: savedPlace)
        }
        
        // Initialize ViewController
        let viewController = SavedPlaceListViewController(viewModel: viewModel)
        
        // Install Handlers
        viewController.didHide = { [weak self] in
            self?.finish()
        }
        
        //
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func runSavedPlaceDetailFlow(with savedPlace: SavedPlace) {
        let coordinator = SavedPlaceDetailFlowCoordinator(savedPlace: savedPlace, navigationController: navigationController)
        pushCoordinator(coordinator)
    }
    
}

