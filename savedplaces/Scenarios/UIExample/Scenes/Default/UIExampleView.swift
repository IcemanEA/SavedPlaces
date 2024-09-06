//
//  SavedPlaceListView.swift
//  savedplaces
//
//  Created by Alexander Zhuchkov on 05.09.2024.
//

import UIKit
import LaudoKit
import Stevia

// MARK: - Type Alias
typealias UIExampleUIView = UIExampleViewType & UIView

// MARK: - Responder
protocol UIExampleViewResponder: AnyObject {
    
    // MARK: - Actions
    func actionButtonOnTouch(_ view: UIExampleViewType)
}

// MARK: - View Type
protocol UIExampleViewType: AnyObject {
    
    // MARK: - Properties
    var responder: UIExampleViewResponder? { get set }
    
    // MARK: - Methods
    func update(state: UIExampleState)
}

// MARK: - View
final class UIExampleView: LView {
    
    // MARK: - Output
    weak var responder: UIExampleViewResponder?
    
    // MARK: - Subviews
    private let titleLabel = LLabel(
        text: "Hello world. Text text. Hello world. Text text. Hello world. Text text. Hello world. Text text. Hello world. Text text. Hello world. Text text. Hello world. Text text.",
        font: UIFont.systemFont(ofSize: 15)
    )
    .foregroundColor(.red)
    .numberOfLines(0)
    
    private lazy var actionButton = LButton().text("Click me")
        .font(.boldSystemFont(ofSize: 20))
        .foregroundColor(.yellow)
        .backgroundColor(.blue)
        .insets(forContentPadding: .init(top: 0, left: 30, bottom: 0, right: 30), imageTitlePadding: 0)
        .onTouch { [weak self] button in
            guard let self = self else { return }
            
            self.responder?.actionButtonOnTouch(self)
        }
    
    private lazy var dummyView = LView()
        .backgroundColor(.yellow)
        .height(50)
//        .onTouch { [weak self] _ in
//            guard let self = self else { return }
//            self.responder?.savedPlaceListView(self, didSelectSavedPlaceAt: 1)
//        }
    
    private lazy var stackView = LVerticalStackView(arrangedSubviews: [titleLabel, actionButton, dummyView])
        .spacing(20)
        
    // MARK: - Container Views
    
    // MARK: - Internal Properties
    
    // MARK: - Overrides
    override func initialize() {
        
        // Setup
        backgroundColor(.systemBackground)
        
        // Subviews
        subviews {
            stackView
        }
        
        // Layout
        stackView.fillHorizontally(padding: 40)
            .centerVertically()
    }
}

// MARK: - Public API
extension UIExampleView: UIExampleViewType {
    
    func update(state: UIExampleState) {
        titleLabel.text(state.rawValue)
        switch state {
        case .idle:
            dummyView.backgroundColor(.yellow)
        case .loading:
            dummyView.backgroundColor(.orange)
        case .loaded:
            dummyView.backgroundColor(.green)
        }
    }
}
