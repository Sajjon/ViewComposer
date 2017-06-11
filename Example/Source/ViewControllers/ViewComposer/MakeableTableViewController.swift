//
//  MakeableTableViewController.swift
//  Example
//
//  Created by Alexander Cyon on 2017-06-11.
//  Copyright © 2017 Alexander Cyon. All rights reserved.
//


import UIKit
import ViewComposer

private let cellId = "cellIdentifier"
final class MakeableTableViewController: UIViewController {
    
    lazy var tableView: UITableView = [.backgroundColor(.red), .dataSourceDelegate(self), .registerCells([CellClass(UITableViewCell.self, cellId)])]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        title = "ViewComposer - TableView"
    }
}

extension MakeableTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = "Row: \(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected row: \(indexPath.row)")
    }
}

private extension MakeableTableViewController {
    func setupViews() {
        view.backgroundColor = .white
        edgesForExtendedLayout = []
        automaticallyAdjustsScrollViewInsets = false
        view.addSubview(tableView)
        tableView.pinEdges(to: view)
    }
}
