//
//  WebBrowserViewModel.swift
//  RSS-Reader
//
//  Created by Alex Honcharenko on 01.03.2020.
//  Copyright © 2020 Oleksandr Honcharenko. All rights reserved.
//

import Foundation

final class WebBrowserViewModel {
    
    var url: URL
    let errorAlertTitle = "Could Not Page"
    let okButtonTitle = "Ok"
    
    init(with url: URL) {
        self.url = url
    }
}
