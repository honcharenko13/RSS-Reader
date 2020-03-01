//
//  ClassIdentifier+Utiility.swift
//  RSS-Reader
//
//  Created by Alex Honcharenko on 01.03.2020.
//  Copyright © 2020 Oleksandr Honcharenko. All rights reserved.
//

import Foundation

protocol Identifiable {
    static var classStringName: String { get }
    static var identifier: String { get }
}

extension NSObject: Identifiable {
    static public var classStringName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    static var identifier: String {
        return classStringName
    }
}
