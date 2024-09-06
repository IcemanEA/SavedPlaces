//
//  MainFlowCoordinator.swift
//  savedplaces
//
//  Created by Alexander Zhuchkov on 05.09.2024.
//

import UIKit
import LaudoKit

class MainFlowCoordinator: Coordinator {
    
    // MARK: - Internal Properties
    private let navigationController = UINavigationController()
    
    // MARK: - Properties
    var rootViewController: UIViewController {
        return navigationController
    }
    
    // MARK: - Overrides
    override func start() {
        
        navigationController.delegate = self
        
        showMain()
        
        DispatchQueue.main.async {
            self.runSavedPlaceFlow()
        }
    }
    
    // MARK: - Methods
    private func showMain() {
        
        // Initialize ViewController
        let viewController = MainViewController()
        
        // Install Handlers
        viewController.didSelectSavedPlaceList = { [weak self] in
            self?.runSavedPlaceListFlow()
        }
        
        viewController.didSelectSavedPlaceDetailVertical = { [weak self] in
            self?.runSavedPlaceDetailVerticalFlow()
        }
        
        viewController.didSelectSavedPlaceDetailHorizontal = { [weak self] in
            self?.runSavedPlaceDetailHorizontalFlow()
        }
        
        
        // Show
        navigationController.pushViewController(viewController, animated: false)
        
    }
    
    private func runSavedPlaceListFlow() {
        let coordinator = SavedPlaceListFlowCoordinator(navigationController: navigationController)
        pushCoordinator(coordinator)
    }
    
    private func runSavedPlaceDetailVerticalFlow() {
        let coordinator = SavedPlaceDetailFlowCoordinator(savedPlace: SavedPlace.default, presentingViewController: rootViewController)
        pushCoordinator(coordinator)
    }
    
    private func runSavedPlaceDetailHorizontalFlow() {
        let coordinator = SavedPlaceDetailFlowCoordinator(savedPlace: SavedPlace.default, navigationController: navigationController)
        pushCoordinator(coordinator)
    }
    
    private func runSavedPlaceFlow() {
        let coordinator = SavedPlaceFlowCoordinator(navigationController: navigationController)
        pushCoordinator(coordinator)
    }
}
