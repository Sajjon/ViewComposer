//
//  Styleable.swift
//  ViewComposer1
//
//  Created by Alexander Cyon on 2018-04-25.
//  Copyright © 2018 cyon. All rights reserved.
//

import Foundation

public protocol Styleable: ExpressibleByArrayLiteral {
    associatedtype Attribute: BaseAttribute
    associatedtype Style: StyleProtocol
    associatedtype ArrayLiteralElement = Attribute
}

/// Makes it possible to instantiate and style `Makeable` from array literal like this: `let label: UILabel = [.text("foo")]`
public extension Styleable where Self: Makeable, Self.Styled == Self {
    init(arrayLiteral elements: Self.Attribute...) {
        self = Self.make(elements)
    }
}
