//
//  MainFlowController.swift
//  RSS-Reader
//
//  Created by Alex Honcharenko on 28.02.2020.
//  Copyright © 2020 Oleksandr Honcharenko. All rights reserved.
//

import UIKit

final class MainFlowController {
    
    var rootViewController: UIViewController?
    var navigationController: UINavigationController
    
    init() {
        navigationController = UINavigationController()
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "ListViewController") as? ListViewController else { return }
        viewController.viewModel = ListViewModel()
        viewController.flowController = self
        rootViewController = viewController
        navigationController.pushViewController(viewController, animated: false)
    }
}
