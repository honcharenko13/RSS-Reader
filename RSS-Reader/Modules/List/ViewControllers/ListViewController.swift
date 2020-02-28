//
//  ListViewController.swift
//  RSS-Reader
//
//  Created by Alex Honcharenko on 28.02.2020.
//  Copyright © 2020 Oleksandr Honcharenko. All rights reserved.
//

import UIKit

final class ListViewController: UIViewController {
    
    var viewModel: ListViewModel!
    var flowController: MainFlowController?
    
    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        viewModel.loadData()
    }
}
