//
//  SavedPlaceViewController.swift
//  savedplaces
//
//  Created by Alexander Zhuchkov on 05.09.2024.
//

import UIKit
import LaudoKit
import Stevia

final class SavedPlaceListViewController: NiblessViewController {
    
    // MARK: - Types
    typealias DataSource = UITableViewDiffableDataSource<String, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<String, String>
    
    // MARK: - Internal Properties
    private let viewModel: SavedPlaceListViewModelType
    
    // MARK: - Subviews
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.delegate = self
        tableView.register(SavedPlaceCell.self, forCellReuseIdentifier: SavedPlaceCell.identifier)
        
        return tableView
    }()
    
    private lazy var dataSource: DataSource = {
        return DataSource(tableView: tableView) { tableView, indexPath, itemIdentifier in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: SavedPlaceCell.identifier, for: indexPath)
            
         //   (cell as? SavedPlaceCell)?.configure(with: ...)
            
            return cell
        }
    }()
    
    // MARK: - Initialization
    init(viewModel: SavedPlaceListViewModelType) {
        self.viewModel = viewModel
        super.init()
        
        
        self.title = "DEMO"
    }
    
    // MARK: - Methods
    private func setupView() {
        view.backgroundColor = .systemBackground
        
        view.subviews {
            tableView
        }
        
        tableView.fillContainer()
        
        updateView()
    }
    
    private func updateView() {
        var snapshot = Snapshot()
        snapshot.appendSections([""])
        
        var items = [String]()
        for idx in 1...100 {
            items.append("Item \(idx)" )
        }
        snapshot.appendItems(items, toSection: "")
        
        dataSource.apply(snapshot)
        
    }
    
}

// MARK: - ViewController Life Cycle
extension SavedPlaceListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: - UITableViewDelegate
extension SavedPlaceListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("SELECT at indexPath", indexPath)
    }
}
