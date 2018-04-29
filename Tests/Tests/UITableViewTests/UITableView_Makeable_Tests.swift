//
//  UITableView_Makeable_Tests.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2018-04-29.
//

import Foundation
import XCTest
@testable import ViewComposer

class UITableViewMakeableTests: XCTestCase {
    func testMakingTableViewView() {
        let tableViewDataSource = TestTableViewDataSource()
        let tableView: UITableView = [.dataSource(tableViewDataSource)]
        assertIs(tableView.dataSource as? TestTableViewDataSource, is: tableViewDataSource)
    }

    func testCreatingGrouped() {
        let tableView: UITableView = [.style(.grouped)]
        assertIs(tableView.style, is: .grouped)
    }

    func testCreatingPlain() {
        let tableView: UITableView = [.style(.plain)]
        assertIs(tableView.style, is: .plain)
    }
}
