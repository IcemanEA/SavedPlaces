//
//  AppCoordinator.swift
//  savedplaces
//
//  Created by Alexander Zhuchkov on 05.09.2024.
//

import UIKit
import LaudoKit

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    private let window: UIWindow
    
    // MARK: - Inititalization
    init(window: UIWindow) {
        self.window = window
        super.init()
        
        // Setup Window Appearance
        setupAppearance()
        
        // Initialize Coordinators
        let mainCoordinator = MainFlowCoordinator()
        
        // Append to Child Coordinators
        childCoordinators.append(mainCoordinator)
        
        // Set RootViewController
        window.rootViewController = mainCoordinator.rootViewController
    }
    
    // MARK: - Overrides
    override func start() {
        childCoordinators.forEach { (childCoordinator) in
            // Start Child Coordinator
            childCoordinator.start()
        }
    }
    
    
    // MARK: - Helper Methods
    private func setupAppearance() {
        window.tintColor = .blue
  //      UINavigationBar().standardAppearance =
    }
    
}
