//
//  ViewAttribute+Operators.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-04.
//
//

import Foundation

//MARK: RHS `[ViewAttribute]`
// CHOSING RIGHT
public func <<- (lhs: [ViewAttribute], rhs: [ViewAttribute]) -> ViewStyle {
    return lhs.merge(master: rhs)
}

// CHOSING LEFT
public func <- (lhs: [ViewAttribute], rhs: [ViewAttribute]) -> ViewStyle {
    return lhs.merge(slave: rhs)
}

//MARK: RHS `ViewAttribute`
// CHOSING RIGHT
public func <<- (lhs: [ViewAttribute], rhs: ViewAttribute) -> ViewStyle {
    return lhs <<- [rhs]
}

// CHOSING LEFT
public func <- (lhs: [ViewAttribute], rhs: ViewAttribute) -> ViewStyle {
    return lhs <- [rhs]
}

//MARK: RHS `[ViewAttribute]`
// CHOSING RIGHT
public func <<- (lhs: ViewAttribute, rhs: [ViewAttribute]) -> ViewStyle {
    return [lhs] <<- rhs
}

// CHOSING LEFT
public func <- (lhs: ViewAttribute, rhs: [ViewAttribute]) -> ViewStyle {
    return [lhs] <- rhs
}

//MARK: RHS `ViewAttribute`
// CHOSING RIGHT
public func <<- (lhs: ViewAttribute, rhs: ViewAttribute) -> ViewStyle {
    return [lhs] <<- rhs
}

// CHOSING LEFT
public func <- (lhs: ViewAttribute, rhs: ViewAttribute) -> ViewStyle {
    return [lhs] <- rhs
}
