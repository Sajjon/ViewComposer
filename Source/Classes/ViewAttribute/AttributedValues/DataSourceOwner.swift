//
//  DataSourceOwner.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-11.
//
//

import Foundation

protocol DataSourceOwner: class {
    var dataSourceProxy: NSObjectProtocol? { get set }
}

extension DataSourceOwner {
    func setDataSource(_ dataSource: NSObjectProtocol?) {
        dataSourceProxy = dataSource
    }
}

extension UITableView: DataSourceOwner {
    var dataSourceProxy: NSObjectProtocol? {
        get { return self.dataSource }
        set {
            guard let specificDataSource = newValue as? UITableViewDataSource else { return }
            self.dataSource = specificDataSource
        }
    }
}

extension UICollectionView: DataSourceOwner {
    var dataSourceProxy: NSObjectProtocol? {
        get { return self.dataSource }
        set {
            guard let specificDataSource = newValue as? UICollectionViewDataSource else { return }
            self.dataSource = specificDataSource
        }
    }
}

extension UIPickerView: DataSourceOwner {
    var dataSourceProxy: NSObjectProtocol? {
        get { return self.dataSource }
        set {
            guard let specificDataSource = newValue as? UIPickerViewDataSource else { return }
            self.dataSource = specificDataSource
        }
    }
}
