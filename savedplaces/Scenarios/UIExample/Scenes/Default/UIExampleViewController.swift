//
//  SavedPlaceListViewController.swift
//  savedplaces
//
//  Created by Alexander Zhuchkov on 05.09.2024.
//

import UIKit
import LaudoKit
import Combine

// MARK: - View Controller
 final class UIExampleViewController: NiblessViewController {
    
    // MARK: - Input
    private let viewModel: UIExampleViewModelType
    private let ui: UIExampleUIView
    
    // MARK: - Output
    var didHide: (() -> Void)?
    
    // MARK: - Properties
    private var bindings = Set<AnyCancellable>()
    
    // MARK: - Initialization
    init(viewModel: UIExampleViewModelType, ui: UIExampleUIView = UIExampleView()) {
        // Properties
        self.viewModel = viewModel
        self.ui = ui
        
        // Super Initilizer
        super.init()
        
        // Setup
        setupView()
    }
    
    // MARK: - Methods
    private func setupView() {
        ui.responder = self
        title = "Saved Place List"
        setupViewModel()
    }
    
    private func updateView() {
        
    }
    
    // MARK: - Helper Methods
    private func setupViewModel() {
        viewModel.statePublisher.sink { [weak self] state in
            self?.ui.update(state: state)
        }.store(in: &bindings)
    }
}

// MARK: - View Controller Life Cycle
extension UIExampleViewController {
    
    override func loadView() {
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupViewModel()
    }
}

// MARK: - UIResponder
extension UIExampleViewController: UIExampleViewResponder {
    
    func actionButtonOnTouch(_ view: any UIExampleViewType) {
        viewModel.changeState()
    }
}
