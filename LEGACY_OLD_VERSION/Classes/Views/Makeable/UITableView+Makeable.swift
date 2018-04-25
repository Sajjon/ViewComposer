//
//  UITableView+Makeable.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-11.
//
//

import Foundation

extension UITableView: Makeable {
    public typealias Style = ViewStyle
    public static func createEmpty() -> UITableView {
        return UITableView(frame: .zero, style: .plain)
    }
}
