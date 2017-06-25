//
//  CollectionTableView.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-25.
//
//

import Foundation

public protocol CollectionTableView: class {
    var allowsMultipleSelection: Bool { get set }
    var allowsSelection: Bool { get set }
    var remembersLastFocusedIndexPath: Bool { get set }
    var backgroundView: UIView? { get set }
}

extension UICollectionView: CollectionTableView {}
extension UITableView: CollectionTableView {}

internal extension CollectionTableView {
    func apply(_ style: ViewStyle) {
        style.attributes.forEach {
            switch $0 {
            case .backgroundView(let view):
                backgroundView = view
            case .allowsMultipleSelection(let allowSelection):
                allowsMultipleSelection = allowSelection
            case .allowsSelection(let allowSelection):
                allowsSelection = allowSelection
            case .remembersLastFocusedIndexPath(let remembers):
                remembersLastFocusedIndexPath = remembers
            default:
                break
            }
        }
    }
}
