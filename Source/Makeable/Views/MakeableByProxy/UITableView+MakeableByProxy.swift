//
//  UITableView+Makeable.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2018-04-29.
//

import UIKit

extension UITableView: MakeableByProxy {
    public typealias Style = TableViewStyle
    public typealias Proxy = TableView
}
