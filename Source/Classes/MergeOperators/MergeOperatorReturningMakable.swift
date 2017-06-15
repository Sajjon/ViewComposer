//
//  MergeOperatorReturningMakable.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-05.
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
public func <<- <A: Attributed, M: Makeable>(lhs: A, rhs: A) -> M where M.Style == A, M.Styled == M {
    return M.make(lhs <<- rhs)
}

// RHS SLAVE
public func <- <A: Attributed, M: Makeable>(lhs: A, rhs: A) -> M where M.Style == A, M.Styled == M {
    return M.make(lhs <- rhs)
}

//MARK: RHS `[Attributed.Attribute]`
// RHS MASTER
public func <<- <A: Attributed, M: Makeable>(lhs: A, rhs: [A.Attribute]) -> M where M.Style == A, M.Styled == M {
    return M.make(lhs <<- rhs)
}

// RHS SLAVE
public func <- <A: Attributed, M: Makeable>(lhs: A, rhs: [A.Attribute]) -> M where M.Style == A, M.Styled == M {
    return M.make(lhs <- rhs)
}

//MARK: RHS `Attributed.Attribute`
// RHS MASTER
public func <<- <A: Attributed, M: Makeable>(lhs: A, rhs: A.Attribute) -> M where M.Style == A, M.Styled == M {
    return M.make(lhs <<- rhs)
}

// RHS SLAVE
public func <- <A: Attributed, M: Makeable>(lhs: A, rhs: A.Attribute) -> M where M.Style == A, M.Styled == M {
    return M.make(lhs <- rhs)
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
public func <<- <A: Attributed, M: Makeable>(lhs: [A.Attribute], rhs: A) -> M where M.Style == A, M.Styled == M {
    return M.make(lhs <<- rhs)
}

// RHS SLAVE
public func <- <A: Attributed, M: Makeable>(lhs: [A.Attribute], rhs: A) -> M where M.Style == A, M.Styled == M {
    return M.make(lhs <- rhs)
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
public func <<- <A: Attributed, M: Makeable>(lhs: A.Attribute, rhs: A) -> M where M.Style == A, M.Styled == M {
    return M.make([lhs] <<- rhs)
}

// RHS SLAVE
public func <- <A: Attributed, M: Makeable>(lhs: A.Attribute, rhs: A) -> M where M.Style == A, M.Styled == M {
    return M.make([lhs] <- rhs)
}
