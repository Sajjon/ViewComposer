//
//  Makeable.swift
//  ViewComposer1
//
//  Created by Alexander Cyon on 2018-04-25.
//  Copyright © 2018 cyon. All rights reserved.
//

import UIKit

public protocol EmptyInitializable {
    associatedtype Styled
    static func createEmpty() -> Styled
}

/// Type that can be instantiated using static method `make([Style.Attribute])`
public protocol Makeable: EmptyInitializable, Styleable {
    static func make(_ attributes: [Attribute]) -> Styled
}

extension Makeable where Self.Styled == Self {
    /// Allow for use of array literals statically like this `UIButton.make(.text("foo"), .textColor(.red))`
    public static func make(_ elements: Attribute...) -> Styled {
        return make(elements)
    }

    /// Allows for use of static instatiation like this: `UIButton.make([.text("foo"), .textColor(.red)])`
    public static func make(_ attributes: [Attribute]) -> Styled {
        let style = Style.init(tuples: attributes.asTuples()) { (_, last) in last }
        return make(style)
    }

    /// Statically creates a `Makeable` using a style - a collection of attributes.
    ///
    /// - Parameter style: `Style` contains a collection of attributes.
    /// - Returns: retuens a `Styled` instance, which refers to the `Makable` _itself_.
    public static func make(_ style: Style) -> Styled {
        let styled = createEmpty()
        if let view = styled as? UIView {
            style.install(on: view)
        }
        return styled
    }
}

/// Makes (pun intended) it possible to write `let label: UILabel = make([.text("hi")])` notice the lack of `.` in `.make`.
public func make<M: Makeable>(_ attributes: [M.Attribute]) -> M where M.Styled == M {
    return M.make(attributes)
}

/// Makes (pun intended) it possible to write `let label: UILabel = make([.text("hi")])` notice the lack of `.` in `.make`.
public func make<M: Makeable>(_ style: M.Style) -> M where M.Styled == M {
    return M.make(style)
}

// Array literals support
public func make<M: Makeable>(_ attributes: M.Attribute...) -> M where M.Styled == M {
    return make(attributes)
}
