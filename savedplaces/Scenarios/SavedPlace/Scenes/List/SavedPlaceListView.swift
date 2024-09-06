//
//  SavedPlaceListView.swift
//  savedplaces
//
//  Created by Egor Ledkov on 06.09.2024.
//

import UIKit
import LaudoKit
import Stevia

// MARK: - Type Alias
typealias SavedPlaceListUIView = SavedPlaceListViewType & UIView

// MARK: - Responder
protocol SavedPlaceListViewResponder: AnyObject {
    
    // MARK: - Actions
    func deleteItem(at index: Int)
    func selectItem(at index: Int)
}

// MARK: - View Type
protocol SavedPlaceListViewType: AnyObject {
    
    // MARK: - Properties
    var responder: SavedPlaceListViewResponder? { get set }
    
    // MARK: - Methods
    func update(with items: [SavedPlaceListViewController.ViewModel])
}

// MARK: - View
final class SavedPlaceListView: LView {
    
    // MARK: - Types
    typealias DataSource = UITableViewDiffableDataSource<String, SavedPlaceListViewController.ViewModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<String, SavedPlaceListViewController.ViewModel>
    
    // MARK: - Output
    weak var responder: SavedPlaceListViewResponder?
    
    // MARK: - Subviews
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.delegate = self
        tableView.register(SavedPlaceCell.self, forCellReuseIdentifier: SavedPlaceCell.identifier)
        
        return tableView
    }()
    
    // MARK: - Container Views
    
    // MARK: - Internal Properties
    private lazy var dataSource: DataSource = {
        return DataSource(tableView: tableView) { tableView, indexPath, itemIdentifier in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: SavedPlaceCell.identifier, for: indexPath)
            
            (cell as? SavedPlaceCell)?.configure(with: itemIdentifier)
            
            return cell
        }
    }()
    
    
    // MARK: - Overrides
    override func initialize() {
        
        // Setup
        backgroundColor(.systemBackground)
        
        // Subviews
        subviews {
            tableView
        }
        
        // Layout
        tableView.fillContainer()
    }
}

// MARK: - UITableViewDelegate
extension SavedPlaceListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        responder?.selectItem(at: indexPath.row)
//        responder?.deleteItem(at: indexPath.row)
//        if let item = dataSource.itemIdentifier(for: indexPath) {
//            var currentSnapshot = dataSource.snapshot()
//            currentSnapshot.deleteItems([item])
//            dataSource.apply(currentSnapshot)
//        }
    }
}

// MARK: - Public API
extension SavedPlaceListView: SavedPlaceListViewType {
    
    func update(with items: [SavedPlaceListViewController.ViewModel]) {
        var snapshot = Snapshot()
        snapshot.appendSections([""])
        
        snapshot.appendItems(items, toSection: "")
        
        dataSource.apply(snapshot)
    }
}

