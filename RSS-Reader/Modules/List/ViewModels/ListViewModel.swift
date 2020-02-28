//
//  ListViewModel.swift
//  RSS-Reader
//
//  Created by Alex Honcharenko on 28.02.2020.
//  Copyright © 2020 Oleksandr Honcharenko. All rights reserved.
//

final class ListViewModel {
    
    let networkManager = NetworkManager()
    
    func loadData() {
        networkManager.loadNews { (items, error) in
            print(items)
        }
    }
}
