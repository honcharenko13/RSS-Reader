//
//  WebBrowserViewController.swift
//  RSS-Reader
//
//  Created by Alex Honcharenko on 01.03.2020.
//  Copyright © 2020 Oleksandr Honcharenko. All rights reserved.
//

import UIKit
import WebKit
final class WebBrowserViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet private weak var webView: WKWebView!
    
    var flowController: WebBrowserFlowController?
    var viewModel: WebBrowserViewModel!
    
    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    // MARK: - Set up functions
    private func configure() {
        webView.navigationDelegate = self
        webView.load(URLRequest(url: viewModel.url))
    }
    
    // MARK: - Actions
    @IBAction private func previousButtonWasTapped(_ sender: UIBarButtonItem) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction private func nextButtonWasTapped(_ sender: UIBarButtonItem) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBAction private func doneButtonWasTapped(_ sender: UIBarButtonItem) {
        flowController?.dismiss()
    }
    
    @IBAction private func refreshButtonWasTapped(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
    // MARK: - Helper functions
    private func displayAlert(with error: Error) {
        let alert = UIAlertController(title: viewModel.errorAlertTitle, message: error.localizedDescription,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: viewModel.okButtonTitle, style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - WKNavigationDelegate
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        displayAlert(with: error)
    }
}
