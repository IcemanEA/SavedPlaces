//
//  SavedPlaceViewViewModel+SavedPlaceCell.swift
//  savedplaces
//
//  Created by Alexander Zhuchkov on 05.09.2024.
//

import UIKit
import Stevia
import LaudoKit

protocol SavedPlacePresentable: Hashable {
    var title: String? { get }
    var subtitle: String? { get }
}

extension SavedPlaceListView {
    class SavedPlaceCell: LTableViewCell {
        
        // MARK: - Subviews
        private let titleLabel = LLabel(text: "Title")
        private let subtitleLabel = LLabel(text: "Subtitle")
            .foregroundColor(.gray)
        
        private lazy var mainStackView = LVerticalStackView(arrangedSubviews: [titleLabel, subtitleLabel])
            .spacing(3)
        
        //
        override func initialize() {
            super.initialize()
            
            subviews {
                mainStackView
            }
            
            mainStackView
                .fillVertically(padding: 5)
                .fillHorizontally(padding: 20)
        }
        
        func configure(with presentable: SavedPlaceListViewController.ViewModel) {
            if let text = presentable.title {
                titleLabel.text(text)
            } else {
                titleLabel.isHidden = true
            }
            
            subtitleLabel.text(presentable.subtitle)
        }
    }
}

