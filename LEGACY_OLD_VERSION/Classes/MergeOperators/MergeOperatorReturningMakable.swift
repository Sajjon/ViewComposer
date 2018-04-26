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
// CHOSING RIGHT
public func <<- <M: Makeable>(lhs: M.Style, rhs: M.Style) -> M where M.Styled == M {
    return M.make(lhs <<- rhs)
}

// CHOSING LEFT
public func <- <M: Makeable>(lhs: M.Style, rhs: M.Style) -> M where M.Styled == M {
    return M.make(lhs <- rhs)
}

//MARK: RHS `[Attributed.Attribute]`
// CHOSING RIGHT
public func <<- <M: Makeable>(lhs: M.Style, rhs: [M.Style.Attribute]) -> M where M.Styled == M {
    return M.make(lhs <<- rhs)
}

// CHOSING LEFT
public func <- <M: Makeable>(lhs: M.Style, rhs: [M.Style.Attribute]) -> M where M.Styled == M {
    return M.make(lhs <- rhs)
}

//MARK: RHS `Attributed.Attribute`
// CHOSING RIGHT
public func <<- <M: Makeable>(lhs: M.Style, rhs: M.Style.Attribute) -> M where M.Styled == M {
    return M.make(lhs <<- rhs)
}

// CHOSING LEFT
public func <- <M: Makeable>(lhs: M.Style, rhs: M.Style.Attribute) -> M where M.Styled == M {
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
// CHOSING RIGHT
public func <<- <M: Makeable>(lhs: [M.Style.Attribute], rhs: M.Style) -> M where M.Styled == M {
    return M.make(lhs <<- rhs)
}

// CHOSING LEFT
public func <- <M: Makeable>(lhs: [M.Style.Attribute], rhs: M.Style) -> M where M.Styled == M {
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
// CHOSING RIGHT
public func <<- <M: Makeable>(lhs: M.Style.Attribute, rhs: M.Style) -> M where M.Styled == M {
    return M.make([lhs] <<- rhs)
}

// CHOSING LEFT
public func <- <M: Makeable>(lhs: M.Style.Attribute, rhs: M.Style) -> M where M.Styled == M {
    return M.make([lhs] <- rhs)
}

