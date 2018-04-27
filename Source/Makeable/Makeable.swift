//
//  Makeable.swift
//  ViewComposer1
//
//  Created by Alexander Cyon on 2018-04-25.
//  Copyright © 2018 cyon. All rights reserved.
//

import UIKit

public typealias Composable = Makeable & EmptyInitializable & Styleable
public typealias ComposableByProxy = Makeable & MakeableByProxy & Styleable

public protocol EmptyInitializable {
    init()
}

/// Type that can be instantiated using static method `make([Style.Attribute])`
public protocol Styling {
    static func applyStyle<S>(_ style: S) where S: StyleProtocol
}

public protocol Makeable {
    static func make<A>(_ attributes: [A]) -> Self where A: BaseAttribute
}

public protocol MakeableByProxy {
    associatedtype Proxy: EmptyInitializable //& Makeable
    static func makeProxy<A>(_ attributes: [A]) -> Proxy where A: BaseAttribute
}

public protocol Styleable: ExpressibleByArrayLiteral {
    associatedtype StyleableAttribute: BaseAttribute
    associatedtype Style: StyleProtocol
}

public extension Styleable where Self.Style: AttributedStyleProtocol {
    typealias StyleableAttribute = Self.Style.Attribute
}

/// Makes it possible to instantiate and style `Makeable` from array literal like this: `let label: UILabel = [.text("foo")]`
public extension Styleable where Self: Makeable {
    init(arrayLiteral elements: Self.StyleableAttribute...) {
        self = Self.makeAndStyle(elements)
    }
}

extension Makeable where Self: Styleable {
    public static func makeAndStyle(_ attributes: [Self.StyleableAttribute]) -> Self {
        let `self` = Self.make(attributes)
        if let view = self as? UIView {
            let style = Style.init(tuples: attributes.asTuples()) { (first, last) in last }
            style.install(on: view)
        }
        return self
    }
}

extension Makeable where Self: MakeableByProxy {
    public static func make<A>(_ attributes: [A]) -> Self where A: BaseAttribute {
        // swiftlint:disable force_cast
        return Self.makeProxy(attributes) as! Self
    }
}

extension Makeable where Self: EmptyInitializable {
    public static func make<A>(_ attributes: [A]) -> Self where A: BaseAttribute {
        return self.init()
    }
}

//extension Makeable {
//    /// Allow for use of array literals statically like this `UIButton.make(.text("foo"), .textColor(.red))`
//    public static func make(_ elements: Attribute...) -> Self {
//        return make(elements)
//    }
//
//    /// Allows for use of static instatiation like this: `UIButton.make([.text("foo"), .textColor(.red)])`
//    public static func make(_ attributes: [Attribute]) -> Self {
//        let style = Style.init(tuples: attributes.asTuples()) { (_, last) in last }
//        return make(style)
//    }
//
//    /// Statically creates a `Makeable` using a style - a collection of attributes.
//    ///
//    /// - Parameter style: `Style` contains a collection of attributes.
//    /// - Returns: retuens a `Styled` instance, which refers to the `Makable` _itself_.
//    public static func make(_ style: Style) -> Self {
//        fatalError("do this")
////        let `` = createEmpty()
////        if let view = styled as? UIView {
////            style.install(on: view)
////        }
////        return styled
//    }
//}

/// Makes (pun intended) it possible to write `let label: UILabel = make([.text("hi")])` notice the lack of `.` in `.make`.
//public func make<M: Makeable>(_ attributes: [M.Attribute]) -> M {
//    return M.make(attributes)
//}
//
///// Makes (pun intended) it possible to write `let label: UILabel = make([.text("hi")])` notice the lack of `.` in `.make`.
//public func make<M: Makeable>(_ style: M.Style) -> M {
//    return M.make(style)
//}
//
//// Array literals support
//public func make<M: Makeable>(_ attributes: M.Attribute...) -> M {
//    return make(attributes)
//}
