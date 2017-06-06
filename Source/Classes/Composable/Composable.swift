//
//  Composable.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-06.
//
//

import Foundation


public protocol Composable: Styleable {
    init(_ style: Style?)
    func setupSubviews(with style: Style)
}

extension Composable {
    public func setupSubviews(with style: Style) {}
}

