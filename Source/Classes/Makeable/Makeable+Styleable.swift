//
//  Makeable+Styleable.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-06.
//
//

import Foundation

public extension Styleable where Self: Makeable, Self.Styled == Self, Self.Style.Attribute == Element {
    init(arrayLiteral elements: Self.Element...) {
        self = Self.make(elements)
    }
}
