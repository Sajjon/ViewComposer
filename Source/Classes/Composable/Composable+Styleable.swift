//
//  Composable+Styleable.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-06.
//
//

import Foundation

public extension Styleable where Self: Composable, Self.Style.Attribute == Element {
    init(arrayLiteral elements: Self.Element...) {
        self.init(Style(elements))
    }
}
