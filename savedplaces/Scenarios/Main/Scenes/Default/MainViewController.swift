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
    var didSelectUIExample: (() -> Void)?
    var didSelectSavedPlaceList: (() -> Void)?
    var didSelectSavedPlaceDetailHorizontal: (() -> Void)?
    var didSelectSavedPlaceDetailVertical: (() -> Void)?
    
    // MARK: - Subviews
    private lazy var showUIExampleButton = UIButton(primaryAction: UIAction(title: "Show UI examples", handler: { [weak self] _ in
        self?.didSelectUIExample?()
    }))
    
    private lazy var showListButton = UIButton(primaryAction: UIAction(title: "Show SavedPlace List", handler: { [weak self] _ in
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
            showUIExampleButton
            showListButton
            showVerticalButton
            showHorizontalButton
        }
        
        showUIExampleButton.centerHorizontally()
        showListButton.centerHorizontally()
        showVerticalButton.centerHorizontally()
        showHorizontalButton.centerHorizontally()
        
        showUIExampleButton.top(100)
        showListButton.top(200)
        showVerticalButton.top(300)
        showHorizontalButton.top(400)
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
