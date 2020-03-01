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
        request.response { response in
            
            switch response.result {
            case .success(let data):
                guard let data = data else {
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
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
}
