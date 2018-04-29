//
//  UITableView_Style_Tests.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2018-04-29.
//

import Foundation
import XCTest
@testable import ViewComposer

class UITableViewStyleTests: XCTestCase {
    func testTableViewViewStyle() {
        let tableViewDataSource = TestTableViewDataSource()
        let style: TableViewStyle = [.dataSource(tableViewDataSource)]
        assertIs(style.attribute(named: String.tableViewDataSource, as: TestTableViewDataSource.self), is: tableViewDataSource)
    }
}

class TestTableViewDataSource: NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        abstract
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        abstract
    }

    override init() {}
}
