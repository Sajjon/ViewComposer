//
//  MergeOperatorReturningComposable.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-04.
//
//

import Foundation

////////////////////////////////////////////////
//MARK: -
//MARK: -
//MARK: LHS: `Attributed`
//MARK: -
//MARK: -
////////////////////////////////////////////////

//MARK: RHS `Attributed`
// CHOSING RIGHT
public func <<- <C: Composable>(lhs: C.Style, rhs: C.Style) -> C {
    return C(lhs <<- rhs)
}
// CHOSING LEFT
public func <- <C: Composable>(lhs: C.Style, rhs: C.Style) -> C {
    return C(lhs <- rhs)
}

//MARK: RHS `[Attributed.Attribute]`
// CHOSING RIGHT
public func <<- <C: Composable>(lhs: C.Style, rhs: [C.Style.Attribute]) -> C {
    return C(lhs <<- rhs)
}

// CHOSING LEFT
public func <- <C: Composable>(lhs: C.Style, rhs: [C.Style.Attribute]) -> C {
    return C(lhs <- rhs)
}

//MARK: RHS `Attributed.Attribute`
// CHOSING RIGHT
public func <<- <C: Composable>(lhs: C.Style, rhs: C.Style.Attribute) -> C {
    return C(lhs <<- rhs)
}

// CHOSING LEFT
public func <- <C: Composable>(lhs: C.Style, rhs: C.Style.Attribute) -> C {
    return C(lhs <- rhs)
}

////////////////////////////////////////////////
//MARK: -
//MARK: -
//MARK: LHS: `[Attributed.Attribute]`
//MARK: -
//MARK: -
////////////////////////////////////////////////

//MARK: RHS `Attributed`
// CHOSING RIGHT
public func <<- <C: Composable>(lhs: [C.Style.Attribute], rhs: C.Style) -> C {
    return C(lhs <<- rhs)
}

// CHOSING LEFT
public func <- <C: Composable>(lhs: [C.Style.Attribute], rhs: C.Style) -> C {
    return C(lhs <- rhs)
}

////////////////////////////////////////////////
//MARK: -
//MARK: -
//MARK: LHS: `Attributed.Attribute`
//MARK: -
//MARK: -
////////////////////////////////////////////////

//MARK: RHS `Attributed`
// CHOSING RIGHT
public func <<- <C: Composable>(lhs: C.Style.Attribute, rhs: C.Style) -> C {
    return C([lhs] <<- rhs)
}

// CHOSING LEFT
public func <- <C: Composable>(lhs: C.Style.Attribute, rhs: C.Style) -> C {
    return C([lhs] <- rhs)
}

