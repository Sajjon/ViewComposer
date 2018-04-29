//
//  TableView.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2018-04-29.
//

import UIKit

public final class TableView: UITableView, ProxyMade {    
    public static func staticallyInitializeSinceLackOfEmptyInit(with style: TableViewStyle) -> TableView {
        let tableStyle = style.attribute(named: .tableViewStyle, as: UITableViewStyle.self) ?? .plain
        return TableView(frame: .zero, style: tableStyle)
    }
}

extension TableView: SubKlass {
    public typealias SuperKlassType = UITableView
    public func asSuper() -> SuperKlassType { return self as SuperKlassType }
}
