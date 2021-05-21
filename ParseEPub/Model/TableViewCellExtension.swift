//
//  TableViewCellExtension.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/26.
//

import UIKit

public extension UITableViewCell {
    /// Generated cell identifier derived from class name
    static func cellIdentifier() -> String {
        return String(describing: self)
    }
}
