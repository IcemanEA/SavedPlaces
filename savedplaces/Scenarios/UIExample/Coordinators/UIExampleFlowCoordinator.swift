//
//  SavedPlaceFlowCoordinator.swift
//  savedplaces
//
//  Created by Alexander Zhuchkov on 05.09.2024.
//

import UIKit
import LaudoKit

final class UIExampleFlowCoordinator: Coordinator {
    
    // MARK: - Internal
    private let navigationController: UINavigationController
    private var initialViewController: UIViewController?
    
    // MARK: - Initialization
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.initialViewController = navigationController.viewControllers.last
    }
    
    // MARK: - Overrides
    override func start() {
        showUIExample()
    }
    
    override func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        if viewController === initialViewController {
            // Invoke Finish Handler
            didFinish?(self)
        }
    }
    
    // MARK: - Methods
    private func finish() {
        if let initialViewController {
            navigationController.popToViewController(initialViewController, animated: true)
        }
        
        didFinish?(self)
    }
    
    // MARK: - Methods
    private func showUIExample() {
        
        // Initialize ViewModel
        let viewModel = UIExampleViewModel()
        
        // Initialize ViewController
        let viewController = UIExampleViewController(viewModel: viewModel)
        
        // Install Handlers
        viewController.didHide = { [weak self] in
            self?.finish()
        }
        
        //
        navigationController.pushViewController(viewController, animated: true)
    }
}
