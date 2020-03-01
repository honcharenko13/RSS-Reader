//
//  NewsTableViewCell.swift
//  RSS-Reader
//
//  Created by Alex Honcharenko on 01.03.2020.
//  Copyright © 2020 Oleksandr Honcharenko. All rights reserved.
//

import UIKit

final class NewsTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        textLabel?.numberOfLines = 0
        detailTextLabel?.numberOfLines = 0
    }
    
    func configure(with item: NewsItem) {
        textLabel?.text = item.title
        detailTextLabel?.text = item.itemDescription
    }
}
