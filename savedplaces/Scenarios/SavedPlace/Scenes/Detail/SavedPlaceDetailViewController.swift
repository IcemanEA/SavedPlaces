//
//  SavedPlaceDetailViewController.swift
//  savedplaces
//
//  Created by Alexander Zhuchkov on 05.09.2024.
//

import UIKit
import LaudoKit

class SavedPlaceDetailViewController: NiblessViewController {
    
    // MARK: - Output
    var didHide: (() -> Void)?
    
    
    
    override init() {
        super.init()
        
        self.title = "DETAIL"
    }
    
    private func setupView() {
        view.backgroundColor = .yellow
        
        
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .close, primaryAction: .init(handler: { [weak self] _ in
            self?.didHide?()
        }))
    }
}

// MARK: - ViewController Life Cycle
extension SavedPlaceDetailViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupNavigationBar()
    }
}

