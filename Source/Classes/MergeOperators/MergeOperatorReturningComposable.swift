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
// RHS MASTER
public func <<- <A: Attributed, C: Composable>(lhs: A, rhs: A) -> C where C.Style == A {
    return C(lhs <<- rhs)
}

// RHS SLAVE
public func <- <A: Attributed, C: Composable>(lhs: A, rhs: A) -> C where C.Style == A {
    return C(lhs <- rhs)
}

//MARK: RHS `[Attributed.Attribute]`
// RHS MASTER
public func <<- <A: Attributed, C: Composable>(lhs: A, rhs: [A.Attribute]) -> C where C.Style == A {
    return C(lhs <<- rhs)
}

// RHS SLAVE
public func <- <A: Attributed, C: Composable>(lhs: A, rhs: [A.Attribute]) -> C where C.Style == A {
    return C(lhs <- rhs)
}

//MARK: RHS `Attributed.Attribute`
// RHS MASTER
public func <<- <A: Attributed, C: Composable>(lhs: A, rhs: A.Attribute) -> C where C.Style == A {
    return C(lhs <<- rhs)
}

// RHS SLAVE
public func <- <A: Attributed, C: Composable>(lhs: A, rhs: A.Attribute) -> C where C.Style == A {
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
// RHS MASTER
public func <<- <A: Attributed, C: Composable>(lhs: [A.Attribute], rhs: A) -> C where C.Style == A {
    return C(lhs <<- rhs)
}

// RHS SLAVE
public func <- <A: Attributed, C: Composable>(lhs: [A.Attribute], rhs: A) -> C where C.Style == A {
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
// RHS MASTER
public func <<- <A: Attributed, C: Composable>(lhs: A.Attribute, rhs: A) -> C where C.Style == A {
    return C([lhs] <<- rhs)
}

// RHS SLAVE
public func <- <A: Attributed, C: Composable>(lhs: A.Attribute, rhs: A) -> C where C.Style == A {
    return C([lhs] <- rhs)
}
