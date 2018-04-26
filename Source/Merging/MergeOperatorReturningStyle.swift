//
//  MergeOperatorReturningStyle.swift
//  ViewComposerTests
//
//  Created by Alexander Cyon on 2018-04-26.
//

import Foundation

extension Optional where Wrapped: StyleProtocol {

    func merging(_ other: Wrapped.Attributes, uniquingKeysWith combine: Wrapped.UniquingKeys) rethrows -> Wrapped {
        guard case let .some(wrapped) = self else { return Wrapped(attributes: other) }
        return try wrapped.merging(other, uniquingKeysWith: combine)
    }

    func merging(_ other: Wrapped, uniquingKeysWith combine: Wrapped.UniquingKeys) rethrows -> Wrapped {
        guard case let .some(wrapped) = self else { return other }
        return try wrapped.merging(other, uniquingKeysWith: combine)
    }
}

////////////////////////////////////////////////
//MARK: -
//MARK: LHS: `Attributed`
//MARK: -
////////////////////////////////////////////////

//MARK: RHS `Attributed`
// CHOSING RIGHT
public func <<- <S>(lhs: S, rhs: S) -> S where S: StyleProtocol {
    return lhs.merging(rhs) { (_, r) in r }
}

public func <<- <S>(lhs: S?, rhs: S) -> S where S: StyleProtocol {
    return lhs.merging(rhs) { (_, r) in r }
}

public func <<- <S>(lhs: S, rhs: S?) -> S where S: StyleProtocol {
    guard
}
/*

// CHOSING LEFT
public func <- <S>(lhs: S, rhs: S) -> S where S: StyleProtocol {
    return lhs.merge(slave: rhs)
}

public func <- <S>(lhs: S?, rhs: S) -> S where S: StyleProtocol {
    return lhs.merge(slave: rhs)
}

public func <- <S>(lhs: S, rhs: S?) -> S where S: StyleProtocol {
    return rhs.merge(master: lhs)
}

//MARK: RHS `[Attributed.Attribute]`
// CHOSING RIGHT
public func <<- <S>(lhs: A, rhs: [A.Attribute]) -> S where S: StyleProtocol {
    return lhs.merge(master: rhs)
}

// CHOSING LEFT
public func <- <S>(lhs: A, rhs: [A.Attribute]) -> S where S: StyleProtocol {
    return lhs.merge(slave: rhs)
}

//MARK: RHS `Attributed.Attribute`
// CHOSING RIGHT
public func <<- <S>(lhs: S, rhs: S.Attribute) -> S where S: StyleProtocol {
    return lhs.merge(master: [rhs])
}

// CHOSING LEFT
public func <- <S>(lhs: S, rhs: S.Attribute) -> S where S: StyleProtocol {
    return lhs.merge(slave: [rhs])
}

////////////////////////////////////////////////
//MARK: -
//MARK: LHS: `[Attributed.Attribute]`
//MARK: -
////////////////////////////////////////////////

//MARK: RHS `Attributed`
// CHOSING RIGHT
public func <<- <S>(lhs: [A.Attribute], rhs: A) -> S where S: StyleProtocol {
    return lhs.merge(master: rhs)
}

// CHOSING LEFT
public func <- <S>(lhs: [A.Attribute], rhs: A) -> S where S: StyleProtocol {
    return lhs.merge(slave: rhs)
}

//////////////////////////////////////////////////////////
//MARK: -
//MARK: LHS: `Attributed.Attribute`
//MARK: -
//////////////////////////////////////////////////////////

//MARK: RHS `Attributed`
// CHOSING RIGHT
public func <<- <S>(lhs: A.Attribute, rhs: A) -> S where S: StyleProtocol {
    return rhs.merge(slave: lhs)
}

// CHOSING LEFT
public func <- <S>(lhs: A.Attribute, rhs: A) -> S where S: StyleProtocol {
    return rhs.merge(master: lhs)
}
 */
