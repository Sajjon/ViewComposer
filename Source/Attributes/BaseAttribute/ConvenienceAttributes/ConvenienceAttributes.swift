//
//  ConvenienceAttributes.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2018-04-26.
//

import Foundation

public extension BaseAttribute {

    public static func height<A>(_ value: CGFloat) -> A where A: BaseAttribute {
        return A(name: .height, value: value)
    }
}

