//
//  MainFlowController.swift
//  RSS-Reader
//
//  Created by Alex Honcharenko on 28.02.2020.
//  Copyright © 2020 Oleksandr Honcharenko. All rights reserved.
//

import UIKit

final class MainFlowController: FlowController {
    
    var parentFlowController: FlowController?

    var rootViewController: UIViewController?
    var navigationController: UINavigationController
    
    init() {
        navigationController = UINavigationController()
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "ListViewController") as? ListViewController else { return }
        viewController.viewModel = ListViewModel()
        viewController.viewModel.flowController = self
        viewController.flowController = self
        rootViewController = viewController
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func refresh() {
        (rootViewController as? ListViewController)?.update()
    }
    
    func presentWebBrowser(with urlString: String?) {
        guard let urlString = urlString else { return }
        guard let url = URL(string: urlString) else { return }
        let viewModel = WebBrowserViewModel(with: url)
        let flowController = WebBrowserFlowController()
        flowController.start(with: viewModel)
        flowController.parentFlowController = self
        guard let rootViewController = flowController.rootViewController else { return }
        navigationController.present(rootViewController, animated: true, completion: nil)
    }
    
}

protocol FlowController {
    var rootViewController: UIViewController? { get }
    var parentFlowController: FlowController? { get set }
    
    func refresh()
}

extension FlowController {

    func refresh() {
        
    }
}
