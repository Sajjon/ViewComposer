//
//  MergeOperatorReturningAttributed.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-04.
//
//

import Foundation

////////////////////////////////////////////////
//MARK: -
//MARK: LHS: `Attributed`
//MARK: -
////////////////////////////////////////////////

//MARK: RHS `Attributed`
// CHOSING RIGHT
public func <<- <A: Attributed>(lhs: A, rhs: A) -> A {
    return lhs.merge(master: rhs)
}

public func <<- <A: Attributed>(lhs: A?, rhs: A) -> A {
    return lhs.merge(master: rhs)
}

public func <<- <A: Attributed>(lhs: A, rhs: A?) -> A {
    return rhs.merge(slave: lhs)
}

// CHOSING LEFT
public func <- <A: Attributed>(lhs: A, rhs: A) -> A {
    return lhs.merge(slave: rhs)
}

public func <- <A: Attributed>(lhs: A?, rhs: A) -> A {
    return lhs.merge(slave: rhs)
}

public func <- <A: Attributed>(lhs: A, rhs: A?) -> A {
    return rhs.merge(master: lhs)
}

//MARK: RHS `[Attributed.Attribute]`
// CHOSING RIGHT
public func <<- <A: Attributed>(lhs: A, rhs: [A.Attribute]) -> A {
    return lhs.merge(master: rhs)
}

// CHOSING LEFT
public func <- <A: Attributed>(lhs: A, rhs: [A.Attribute]) -> A {
    return lhs.merge(slave: rhs)
}

//MARK: RHS `Attributed.Attribute`
// CHOSING RIGHT
public func <<- <A: Attributed>(lhs: A, rhs: A.Attribute) -> A {
    return lhs.merge(master: [rhs])
}

// CHOSING LEFT
public func <- <A: Attributed>(lhs: A, rhs: A.Attribute) -> A {
    return lhs.merge(slave: [rhs])
}

////////////////////////////////////////////////
//MARK: -
//MARK: LHS: `[Attributed.Attribute]`
//MARK: -
////////////////////////////////////////////////

//MARK: RHS `Attributed`
// CHOSING RIGHT
public func <<- <A: Attributed>(lhs: [A.Attribute], rhs: A) -> A {
    return lhs.merge(master: rhs)
}

// CHOSING LEFT
public func <- <A: Attributed>(lhs: [A.Attribute], rhs: A) -> A {
    return lhs.merge(slave: rhs)
}

//////////////////////////////////////////////////////////
//MARK: -
//MARK: LHS: `Attributed.Attribute`
//MARK: -
//////////////////////////////////////////////////////////

//MARK: RHS `Attributed`
// CHOSING RIGHT
public func <<- <A: Attributed>(lhs: A.Attribute, rhs: A) -> A {
    return rhs.merge(slave: lhs)
}

// CHOSING LEFT
public func <- <A: Attributed>(lhs: A.Attribute, rhs: A) -> A {
    return rhs.merge(master: lhs)
}
