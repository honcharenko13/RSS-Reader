//
//  NewsItem.swift
//  RSS-Reader
//
//  Created by Alex Honcharenko on 28.02.2020.
//  Copyright © 2020 Oleksandr Honcharenko. All rights reserved.
//

import Foundation
import SWXMLHash

struct NewsItem: XMLIndexerDeserializable {
    let title: String?
    let link: String?
    let itemDescription: String?
   // let thumbnailURL: String?
    
    static func deserialize(_ node: XMLIndexer) throws -> NewsItem {
        return try NewsItem(title: node["title"].value(),
                            link: node["link"].value(),
                            itemDescription: node["description"].value())//,
                            //thumbnailURL: node["description"].value())
    }
    
}
