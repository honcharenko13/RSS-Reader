//
//  NetworkManager.swift
//  RSS-Reader
//
//  Created by Alex Honcharenko on 28.02.2020.
//  Copyright © 2020 Oleksandr Honcharenko. All rights reserved.
//

import Alamofire
import Foundation
import SWXMLHash

protocol NetworkManagerProtocol {
    
    func loadNews(completionHandler: @escaping ([NewsItem]?, Error?) -> Void)
}


final class NetworkManager: NetworkManagerProtocol {
    
    func loadNews(completionHandler: @escaping ([NewsItem]?, Error?) -> Void) {
        let request = AF.request("https://www.wired.com/feed/rss")
        request.responseString { response in
            guard let data = response.value?.data(using: .utf8) else {
                completionHandler(nil, response.error)
                return
            }
            
            let xml = SWXMLHash.parse(data)
            do {
                let newsItems: [NewsItem] = try xml["rss"]["channel"]["item"].value()
                completionHandler(newsItems, nil)
            } catch {
                completionHandler(nil, error)
            }
        }
    }
    
}
