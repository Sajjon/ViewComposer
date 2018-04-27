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

public protocol Makeable: Styleable {
    associatedtype SelfMakeable
    static func make(_ attributes: [Self.StyleableAttribute]) -> SelfMakeable
}

public protocol ProxyMade {
    associatedtype ProxyAttribute: BaseAttribute
    static func staticallyInitializeSinceLackOfEmptyInit(with attributes: [ProxyAttribute]) -> Self
}

public protocol MakeableByProxy {
    associatedtype Proxy: ProxyMade
    static func makeProxy(_ attributes: [Proxy.ProxyAttribute]) -> Proxy
}

extension MakeableByProxy {
    public static func makeProxy(_ attributes: [Proxy.ProxyAttribute]) -> Proxy {
        return Proxy.staticallyInitializeSinceLackOfEmptyInit(with: attributes)
    }
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
        // swiftlint:disable force_cast
        self = Self.makeAndStyle(elements) as! Self
    }
}

extension Makeable {
    public static func makeAndStyle(_ attributes: [Self.StyleableAttribute]) -> SelfMakeable {
        let `self` = Self.make(attributes)
        if let view = self as? UIView {
            let style = Style.init(tuples: attributes.asTuples()) { (first, last) in last }
            style.install(on: view)
        }
        return self
    }
}

extension Makeable where Self: MakeableByProxy, Self.Proxy.ProxyAttribute == Self.StyleableAttribute {
    public static func make(_ attributes: [Self.StyleableAttribute]) -> SelfMakeable {
        // swiftlint:disable force_cast
        return Self.makeProxy(attributes) as! SelfMakeable
    }
}

extension Makeable where Self: EmptyInitializable {
    public static func make(_ attributes: [Self.StyleableAttribute]) -> SelfMakeable {
        // swiftlint:disable force_cast
        return self.init() as! SelfMakeable
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
//let label: UILabel = make([.numberOfLines(1)])
//// Makes (pun intended) it possible to write `let label: UILabel = make([.text("hi")])` notice the lack of `.` in `.make`.
//public func make<M: Makeable & Styleable>(_ attributes: [M.Attribute]) -> M {
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
