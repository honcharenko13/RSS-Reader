//
//  UITableView+Utility.swift
//  RSS-Reader
//
//  Created by Alex Honcharenko on 01.03.2020.
//  Copyright © 2020 Oleksandr Honcharenko. All rights reserved.
//

import UIKit

extension UITableView {

    func dequeueReusableCell<CellType: UITableViewCell>() -> CellType {
        let cell = dequeueReusableCell(withIdentifier: CellType.identifier) as! CellType
        return cell
    }
    
}
