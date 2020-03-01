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
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // MARK: - Set up functions
    private func configure() {
        title = viewModel.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(update))
        
        activityIndicator.hidesWhenStopped = true
        tableView.estimatedRowHeight = 10
        tableView.rowHeight = UITableView.automaticDimension
        
        viewModel.update = { [weak self] error in
            self?.activityIndicator.stopAnimating()
            if let error = error {
                self?.displayAlert(with: error)
                return
            }
            self?.tableView.reloadData()
        }
        update()
    }
    
    // MARK: - Helper functions
    @objc func update() {
        activityIndicator.startAnimating()
        viewModel.loadData()
    }
    
    private func displayAlert(with error: Error) {
        let alert = UIAlertController(title: viewModel.errorAlertTitle, message: error.localizedDescription,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: viewModel.okButtonTitle, style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.item(at: indexPath)
        let cell = tableView.dequeueReusableCell() as NewsTableViewCell
        cell.configure(with: item)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectItem(at: indexPath) {
            
        }
    }
}
