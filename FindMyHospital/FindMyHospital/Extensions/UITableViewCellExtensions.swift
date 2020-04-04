//
//  UITableViewCellExtensions.swift
//  WOVO
//
//  Created by Debasish Mondal on 21/06/19.
//  Copyright © 2019 Indusnet Technologies. All rights reserved.
//

import UIKit

extension UITableViewCell {
    /// Search up the view hierarchy of the table view cell to find the containing table view
    var tableView: UITableView? {
        get {
            var table: UIView? = superview
            while !(table is UITableView) && table != nil {
                table = table?.superview
            }
            
            return table as? UITableView
        }
    }
}
