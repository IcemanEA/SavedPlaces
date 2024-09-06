//
//  SavedPlaceViewController.swift
//  savedplaces
//
//  Created by Alexander Zhuchkov on 05.09.2024.
//

import UIKit
import LaudoKit

// MARK: - View Controller
final class SavedPlaceListViewController: NiblessViewController {
    
    // MARK: - Input
    private let viewModel: SavedPlaceListViewModelType
    private let ui: SavedPlaceListUIView
    
    // MARK: - Output
    var didHide: (() -> Void)?
    var didSelectPlace: ((SavedPlace) -> Void)?
    
    // MARK: - Properties
    
    // MARK: - Initialization
    init(viewModel: SavedPlaceListViewModelType, ui: SavedPlaceListUIView = SavedPlaceListView()) {
        
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
        self.title = "List of places"
        self.ui.responder = self
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .refresh, primaryAction: .init(handler: { [weak self] _ in
            self?.updateView()
        }))
    }
    
    private func updateView() {
        viewModel.fullRefresh()
        ui.update(with: viewModel.items)
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
        
        updateView()
    }
}

// MARK: - UIResponder
extension SavedPlaceListViewController: SavedPlaceListViewResponder {
    func deleteItem(at index: Int) {
        viewModel.deleteItem(at: index)
    }
    
    func selectItem(at index: Int) {
        let item = viewModel.getItem(at: index)
        didSelectPlace?(item)
    }
}
