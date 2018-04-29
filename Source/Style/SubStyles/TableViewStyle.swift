//
//  TableViewStyle.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2018-04-29.
//

import UIKit

public class TableViewStyle: ViewStyle<TableViewAttribute> {
    public convenience required init(arrayLiteral elements: TableViewAttribute...) {
        self.init(attributes: elements)
    }

    public override func install(on view: UIView) {
        super.install(on: view)
        guard let tableView = view as? UITableView else { fatalError("not UITableView") }
        for (name, value) in attributes {
            let v = value
            switch name {
            case .tableViewDataSource:
                if let v = v as? UITableViewDataSource { tableView.dataSource = v }
            default:
                print("⚠️ WARNING Not yet supporting attribute with name: `\(name)`, having value: `\(value)`")
                continue
            }
        }
    }
}

