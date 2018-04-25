//
//  ViewStyle.swift
//  ViewComposer1
//
//  Created by Alexander Cyon on 2018-04-22.
//  Copyright © 2018 cyon. All rights reserved.
//

import UIKit

public protocol StyleProtocol: ExpressibleByArrayLiteral, CustomStringConvertible {
    typealias Key = String
    typealias Value = Any
    typealias UniquingKeys = (Value, Value) throws -> Value
    typealias Attributes = [Key: Value]
    var attributes: Attributes { get }
    init(attributes: Attributes)
    init(tuples: [(Key, Value)], uniquingKeysWith combine: UniquingKeys) rethrows
    func install(on view: UIView)

    func merging(_ other: Attributes, uniquingKeysWith combine: UniquingKeys) rethrows -> Self
}

public extension StyleProtocol {

    func merging(_ other: Attributes, uniquingKeysWith combine: UniquingKeys) rethrows -> Self {
        let merged = try attributes.merging(other, uniquingKeysWith: combine)
        return Self(attributes: merged)
    }
}


public class ViewStyle<A: BaseAttribute>: StyleProtocol {
    public typealias Attribute = A
    public typealias ArrayLiteralElement = A

    public let attributes: [Key: Value]


    public required init(attributes: [Key: Value]) {
        self.attributes = attributes
    }

    public convenience required init(tuples: [(Key, Value)], uniquingKeysWith combine: UniquingKeys) rethrows {
        let _attributes = try Dictionary(tuples, uniquingKeysWith: combine)
        self.init(attributes: _attributes)
    }

    public convenience init(attributes: [A], uniquingKeysWith combine: UniquingKeys = { (_, last) in last }) {
        do {
            let _attributes = try Dictionary(attributes.asTuples(), uniquingKeysWith: combine)
            self.init(attributes: _attributes)
        } catch { fatalError("Failed to create dictionary, \(error)") }
    }

    public convenience required init(arrayLiteral elements: A...) {
        self.init(attributes: elements)
    }

    public func install(on view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        for (name, value) in attributes {
            let v = value
            switch name {
            case .backgroundColor: if let v = v as? UIColor { view.backgroundColor = v }
            default:
                //                print("⚠️ WARNING Not yet supporting attribute with name: `\(name)`, having value: `\(value)`")
                continue
            }
        }
    }
}

public extension ViewStyle {
    var description: String {
        return attributes.description
    }
}
