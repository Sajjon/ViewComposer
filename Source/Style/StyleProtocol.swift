//
//  StyleProtocol.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2018-04-27.
//

import Foundation

public protocol StyleProtocol: ExpressibleByArrayLiteral, CustomStringConvertible {
    typealias Key = String
    typealias Value = Any
    typealias UniquingKeys = (Value, Value) -> Value
    typealias Attributes = [Key: Value]
    var attributes: Attributes { get }
    init(attributes: Attributes)

    // Require the `combine` closure to always return a value. It is not allowed to throw an error as Dictionaries are: https://developer.apple.com/documentation/swift/dictionary/2892961-init
    init(tuples: [(Key, Value)], uniquingKeysWith combine: UniquingKeys)

    init(uniqueKeysWithValues: [(Key, Value)])
    func install(on view: UIView)
    func customInstall(on view: UIView)
    func baseSetup(for view: UIView)

    // Require the `combine` closure to always return a value. It is not allow to throw an error as Dictionaries are: https://developer.apple.com/documentation/swift/dictionary/2892855-merge
    func merging(_ other: Attributes, uniquingKeysWith combine: UniquingKeys) -> Self
}

internal let duplicatesValueErrorMessage = "Array of tuples contained duplicates which was not allowed."
public extension StyleProtocol {
    init(uniqueKeysWithValues: [(Key, Value)]) {
        self.init(tuples: uniqueKeysWithValues) { (first, last) in
            fatalError(duplicatesValueErrorMessage)
        }
    }
}

// UniquingKeys
public var LastValue: (Any, Any) -> Any {
    return { (_, last) in last }
}

// Default implementations
public extension StyleProtocol {
    func merging(_ other: Attributes, uniquingKeysWith combine: UniquingKeys) -> Self {
        let merged = attributes.merging(other, uniquingKeysWith: combine)
        return Self(attributes: merged)
    }
}

// Convenience/Extra
public extension StyleProtocol {

    func merging(_ other: Self, uniquingKeysWith combine: UniquingKeys) -> Self {
        return merging(other.attributes, uniquingKeysWith: combine)
    }

    func merging(_ other: Self?, uniquingKeysWith combine: UniquingKeys) -> Self {
        guard let other = other else { return self }
        return merging(other, uniquingKeysWith: combine)
    }
}
