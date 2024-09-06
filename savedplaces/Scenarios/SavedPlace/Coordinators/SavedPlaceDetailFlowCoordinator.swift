//
//  SavedPlaceDetailFlowCoordinator.swift
//  savedplaces
//
//  Created by Alexander Zhuchkov on 05.09.2024.
//

import UIKit
import LaudoKit


class SavedPlaceDetailFlowCoordinator: Coordinator, UIAdaptivePresentationControllerDelegate {
    
    
    // MARK: - Internal Properties
    private let navigationController: UINavigationController
    private let presentingViewController: UIViewController?
    private let initialViewController: UIViewController?
    private let savedPlace: SavedPlace
    
    // MARK: - Initialization
    init(savedPlace: SavedPlace, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.presentingViewController = nil
        self.savedPlace = savedPlace
        
        // Set Initial View Controller
        self.initialViewController = navigationController.viewControllers.last
    }
    
    init(savedPlace: SavedPlace, presentingViewController: UIViewController) {
        self.presentingViewController = presentingViewController
        self.initialViewController = nil
        self.navigationController = UINavigationController()
        self.savedPlace = savedPlace
        
        super.init()
        self.navigationController.presentationController?.delegate = self
    }
    
    deinit {
        print("DEINIT SAVED PLACE DETAIL FLOW")
    }
    
    // MARK: - Overrides
    override func start() {
        showSavedPlaceDetail()
        
        // Show Flow
        presentingViewController?.present(navigationController, animated: true)
    }
    
    override func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        super.navigationController(navigationController, didShow: viewController, animated: animated)
        
        if viewController === initialViewController {
            // Invoke Finish Handler
            didFinish?(self)
        }
    }
    
    // MARK: - UIAdaptivePresentationControllerDelegate
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        didFinish?(self)
    }
    
    // MARK: - Methods
    private func finish() {
        if let initialViewController {
            navigationController.popToViewController(initialViewController, animated: true)
        }
        
        // Dismiss
        presentingViewController?.dismiss(animated: true)
    
        // Invoke Finish Handler
        didFinish?(self)
    }
    
    private func showSavedPlaceDetail() {
        let viewController = SavedPlaceDetailViewController()
        
        // Install Handler
        viewController.didHide = { [weak self] in
            self?.finish()
        }
        
        // Show
        navigationController.show(viewController, sender: nil)
    }
}
