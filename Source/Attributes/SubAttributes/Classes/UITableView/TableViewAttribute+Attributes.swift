//
//  TableViewAttribute+Attributes.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2018-04-29.
//

import Foundation

public extension TableViewAttribute {

    public static func dataSource<A>(_ value: UITableViewDataSource?) -> A where A: TableViewAttribute {
        return A(name: .tableViewDataSource, value: value as Any)
    }

    public static func style<A>(_ value: UITableViewStyle) -> A where A: TableViewAttribute {
        return A(name: .tableViewStyle, value: value)
    }

}
