//
//  Styleable.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-31.
//
//

import Foundation

public protocol Styleable: ExpressibleByArrayLiteral {
    associatedtype Style: Attributed
    associatedtype Element = Style.Attribute
    func setup(with style: Style)
}

public extension Styleable {
    func setup(with style: Style) {
        style.install(on: self)
    }
}
