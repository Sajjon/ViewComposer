//
//  OperatorDeclaration.swift
//  ViewComposerTests
//
//  Created by Alexander Cyon on 2018-04-26.
//

import Foundation

precedencegroup StyleablePrecedence {
    higherThan: CastingPrecedence
    associativity: right
}

infix operator <- : StyleablePrecedence // merge operator returning `Styleable`
infix operator <<- : StyleablePrecedence // force merge operator returning `Styleable`
