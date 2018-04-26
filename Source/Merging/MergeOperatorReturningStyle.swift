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
    guard let rhs = rhs else { return lhs }
    return lhs.merging(rhs) { (_, r) in r }
}

// CHOSING LEFT
public func <- <S>(lhs: S, rhs: S) -> S where S: StyleProtocol {
    return lhs.merging(rhs) { (l, _) in l }
}

public func <- <S>(lhs: S?, rhs: S) -> S where S: StyleProtocol {
    return lhs.merging(rhs) { (l, _) in l }
}

public func <- <S>(lhs: S, rhs: S?) -> S where S: StyleProtocol {
    guard let rhs = rhs else { return lhs }
    return lhs.merging(rhs) { (l, _) in l }
}

//MARK: RHS `[Attributed.Attribute]`
// CHOSING RIGHT
public func <<- <A, V>(lhs: V, rhs: [A]) -> V where A: BaseAttribute, V: ViewStyle<A> {
    let other = V(attributes: rhs)
    return lhs.merging(other) { (_, r) in r }
}

// CHOSING LEFT
public func <- <A, V>(lhs: V, rhs: [A]) -> V where A: BaseAttribute, V: ViewStyle<A> {
    let rhs = V(attributes: rhs)
    return lhs.merging(rhs) { (l, _) in l }
}

//MARK: RHS `Attributed.Attribute`
// CHOSING RIGHT
public func <<- <A, V>(lhs: V, rhs: A) -> V where A: BaseAttribute, V: ViewStyle<A> {
    return lhs <<- [rhs]
}

// CHOSING LEFT
public func <- <A, V>(lhs: V, rhs: A) -> V where A: BaseAttribute, V: ViewStyle<A> {
    return lhs <- [rhs]
}

////////////////////////////////////////////////
//MARK: -
//MARK: LHS: `[Attributed.Attribute]`
//MARK: -
////////////////////////////////////////////////

//MARK: RHS `Attributed`
// CHOSING RIGHT
public func <<- <A, V>(lhs: [A], rhs: A) -> V where A: BaseAttribute, V: ViewStyle<A> {
    let lhs = V(attributes: lhs)
    return lhs <<- rhs
}

// CHOSING LEFT
public func <- <A, V>(lhs: [A], rhs: A) -> V where A: BaseAttribute, V: ViewStyle<A> {
    let lhs = V(attributes: lhs)
    return lhs <- rhs
}

//////////////////////////////////////////////////////////
//MARK: -
//MARK: LHS: `Attributed.Attribute`
//MARK: -
//////////////////////////////////////////////////////////

//MARK: RHS `Attributed`
// CHOSING RIGHT
public func <<- <A, V>(lhs: A, rhs: V) -> V where A: BaseAttribute, V: ViewStyle<A> {
    let lhs = V(attributes: [lhs])
    return lhs <<- rhs
}

// CHOSING LEFT
public func <- <A, V>(lhs: A, rhs: V) -> V where A: BaseAttribute, V: ViewStyle<A> {
    let lhs = V(attributes: [lhs])
    return lhs <- rhs
}
