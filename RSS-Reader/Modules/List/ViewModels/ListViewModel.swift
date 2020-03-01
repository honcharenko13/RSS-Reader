//
//  ListViewModel.swift
//  RSS-Reader
//
//  Created by Alex Honcharenko on 28.02.2020.
//  Copyright © 2020 Oleksandr Honcharenko. All rights reserved.
//

import UIKit

final class ListViewModel: CollectionViewModel {
    
    var flowController: MainFlowController?
    
    typealias ItemType = NewsItem
    private var items = [NewsItem]()
    
    let title = "News"
    let errorAlertTitle = "Could Not Load New Data"
    let okButtonTitle = "Ok"

    private let networkManager = NetworkManager()
    
    var update: ((Error?) -> Void)?

    // MARK: - CollectionViewModel
    func loadData() {
        networkManager.loadNews { [weak self] (items, error) in
            guard let newItems = items else {
                self?.update?(error)
                return
            }
            self?.items.removeAll(keepingCapacity: true)
            self?.items.append(contentsOf: newItems)
            self?.update?(nil)
        }
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItems(in section: Int) -> Int {
        return items.count
    }
    
    func item(at indexPath: IndexPath) -> NewsItem {
        return items[indexPath.item]
    }
    
    func didSelectItem(at indexPath: IndexPath, completion: @escaping () -> Void) {
        let feed = item(at: indexPath)
        flowController?.presentWebBrowser(with: feed.link)
    }
}

protocol CollectionViewModel {
    
    associatedtype ItemType

    func loadData()

    // MARK: - DataSource
    func numberOfSections() -> Int
    func numberOfItems(in section: Int) -> Int
    /**
     Returns an item (ViewModel) for a cell
     - Parameter indexPath: Index Path of the Object for cell
     - Returns: item (ViewModel) for the Cell
     */
    func item(at indexPath: IndexPath) -> ItemType
    
    // MARK: - Delegate
    func didSelectItem(at indexPath: IndexPath, completion: @escaping () -> Void)
}
