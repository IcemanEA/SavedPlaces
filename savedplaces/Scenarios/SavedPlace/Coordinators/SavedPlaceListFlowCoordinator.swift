//
//  SavedPlaceListFlowCoordinator.swift
//  savedplaces
//
//  Created by Alexander Zhuchkov on 05.09.2024.
//

import UIKit
import LaudoKit

final class SavedPlaceListFlowCoordinator: Coordinator {
    
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
//        let viewModel = SavedPlaceListViewModel(repository: SavedPlaceRepository())
        
        
        
        ///
        let repository: SavedPlaceRepositoryType = SavedPlaceRepository()
        
        // Initialize ViewModel
        let viewModel = SavedPlaceListViewModel(repository: repository)
        
        // Initialize ViewController
        let viewController = SavedPlaceListViewController(viewModel: viewModel)
       
        // Install Handlers
        viewController.didSelectPlace = { [weak self] savedPlace in
            self?.runSavedPlaceDetailFlow(with: savedPlace)
        }
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func runSavedPlaceDetailFlow(with savedPlace: SavedPlace) {
        let coordinator = SavedPlaceDetailFlowCoordinator(savedPlace: savedPlace, navigationController: navigationController)
        pushCoordinator(coordinator)
    }
}
