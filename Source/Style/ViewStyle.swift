//
//  ViewStyle.swift
//  ViewComposer1
//
//  Created by Alexander Cyon on 2018-04-22.
//  Copyright © 2018 cyon. All rights reserved.
//

import UIKit

public protocol SharedStyle {
    func installShared(on view: UIView)
}

public protocol AttributedStyleProtocol: StyleProtocol {
    associatedtype Attribute: BaseAttribute
}

open class ViewStyle<A: BaseAttribute>: AttributedStyleProtocol {
    public typealias Attribute = A
    public typealias ArrayLiteralElement = A

    public let attributes: [Key: Value]

    public required init(attributes: [Key: Value]) {
        self.attributes = attributes
    }

    public convenience required init(tuples: [(Key, Value)], uniquingKeysWith combine: UniquingKeys) {
        let _attributes = Dictionary(tuples, uniquingKeysWith: combine)
        self.init(attributes: _attributes)
    }

    public convenience required init(attributes: [A], uniquingKeysWith combine: UniquingKeys = LastValue) {
        self.init(tuples: attributes.asTuples(), uniquingKeysWith: combine)
    }

    public convenience required init(arrayLiteral elements: A...) {
        self.init(attributes: elements)
    }

    public func customInstall(on view: UIView) {}

    public func baseSetupForView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
    }

    public func installAttributesDeclaredInProtocols(on view: UIView) {
        if let textOwnerStyle = self as? TextOwnerStyle {
            textOwnerStyle.installShared(on: view)
        }
    }

    public func install(on view: UIView) {
        customInstall(on: view)
        baseSetupForView(view)
        installAttributesDeclaredInProtocols(on: view)
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
