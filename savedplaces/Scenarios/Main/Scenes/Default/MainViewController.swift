//
//  MainViewController.swift
//  savedplaces
//
//  Created by Alexander Zhuchkov on 05.09.2024.
//

import UIKit
import LaudoKit
import Stevia

final class MainViewController: NiblessViewController {
    
    // MARK: - Output
    var didHide: (() -> Void)?
    var didSelectSavedPlaceList: (() -> Void)?
    var didSelectSavedPlaceDetailHorizontal: (() -> Void)?
    var didSelectSavedPlaceDetailVertical: (() -> Void)?
    
    // MARK: - Subviews
    private lazy var button = UIButton(primaryAction: UIAction(title: "Show SavedPlaceList", handler: { [weak self] _ in
        self?.didSelectSavedPlaceList?()
    }))
    
    private lazy var showVerticalButton = UIButton(primaryAction: UIAction(title: "Show Vertical Detail", handler: { [weak self] _ in
        self?.didSelectSavedPlaceDetailVertical?()
    }))
    
    private lazy var showHorizontalButton = UIButton(primaryAction: UIAction(title: "Show Horizontal Detail", handler: { [weak self] _ in
        self?.didSelectSavedPlaceDetailHorizontal?()
    }))
    
    
    // MARK: - Initialization
    override init() {
        super.init()
        
        self.title = "Main"
    }
    
    // MARK: - Methods
    private func setupView() {
        
        view.backgroundColor = .systemBackground
        
        view.subviews {
            button
            showVerticalButton
            showHorizontalButton
        }
        
        button.centerHorizontally()
        showVerticalButton.centerHorizontally()
        showHorizontalButton.centerHorizontally()
        
        button.top(100)
        showVerticalButton.top(200)
        showHorizontalButton.top(300)
    }
    
    private func showAlert() {
        
        /*
        let alert = LAlertPresenter(title: "Title", message: "message", acceptTitle: "OK", rejectTitle: "Reject") { outcome in
            switch outcome {
            case .accepted:
                print("Accepted")
            case .rejected:
                print("Reject")
            }
        }
        
        alert.present(in: self) */
        
        let confirmation = LConfirmationPresenter(question: "Delete?", acceptTitle: "Yes", rejectTitle: "No") {
            
        }
        
        confirmation.present(in: self, sender: nil)
        
    //    LAlertPresenter.makeAndPresent(in: self, title: "Title", acceptTitle: "OK")
    }
}

// MARK: - ViewController LifeCycle
extension MainViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupView()
    }
}
