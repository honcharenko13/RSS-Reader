//
//  WebBrowserFlowController.swift
//  RSS-Reader
//
//  Created by Alex Honcharenko on 01.03.2020.
//  Copyright © 2020 Oleksandr Honcharenko. All rights reserved.
//

import UIKit

final class WebBrowserFlowController: FlowController {
    
    var rootViewController: UIViewController?
    
    var parentFlowController: FlowController?
    var webBrowserViewController: WebBrowserViewController? {
        return rootViewController as? WebBrowserViewController
    }
    
    func start(with viewModel: WebBrowserViewModel) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "WebBrowserViewController") as? WebBrowserViewController else { return }
        viewController.viewModel = viewModel
        viewController.flowController = self
        viewController.modalPresentationStyle = .custom
        rootViewController = viewController
    }
    
    func dismiss() {
        webBrowserViewController?.flowController = nil
        let parent = parentFlowController
        webBrowserViewController?.dismiss(animated: true) {
            parent?.refresh()
        }
    }
}
