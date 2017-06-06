//
//  MergeOperators.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-06.
//
//

import Foundation

precedencegroup StyleablePrecedence {
    higherThan: CastingPrecedence
    associativity: left
}

infix operator <- : StyleablePrecedence // merge operator returning `Styleable`
infix operator <<- : StyleablePrecedence // force merge operator returning `Styleable`
