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
class SavedPlaceListViewController: NiblessViewController {
    
    // MARK: - Input
    private let viewModel: SavedPlaceListViewViewModelType
    private let ui: SavedPlaceListUIView
    
    // MARK: - Output
    var didHide: (() -> Void)?
    
    
    // MARK: - Properties
    private var bindings = Set<AnyCancellable>()
    
    // MARK: - Initialization
    init(viewModel: SavedPlaceListViewViewModelType, ui: SavedPlaceListUIView = SavedPlaceListView()) {
        
        // Properties
        self.viewModel = viewModel
        self.ui = ui
        
        // Super Initilizer
        super.init()
        
        // Setup
        self.ui.responder = self
        self.title = "Saved Place List"
    }
    
    // MARK: - Methods
    private func setupView() {
       
    }
    
    private func updateView() {
        
    }
    
    private func setupViewModel() {
        viewModel.statePublisher.sink { [weak self] state in
            self?.ui.update(state: state)
        }.store(in: &bindings)
    }
    
    // MARK: - Helper Methods
}


// MARK: - View Controller Life Cycle
extension SavedPlaceListViewController {
    
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
extension SavedPlaceListViewController: SavedPlaceListViewResponder {
    func savedPlaceListView(_ view: any SavedPlaceListViewType, didSelectSavedPlaceAt index: Int) {
        viewModel.selectSavedPlace(at: index)
    }
    
    func savedPlaceListViewDidTapButton(_ view: any SavedPlaceListViewType) {
        viewModel.changeState()
    }
    
    
    
}
