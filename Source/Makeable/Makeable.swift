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
    static func make(_ style: Style) -> SelfMakeable
}

public protocol ProxyMade: Styleable {
    static func staticallyInitializeSinceLackOfEmptyInit(with style: Style) -> Self
}

public protocol MakeableByProxy: Makeable {
    associatedtype Proxy: ProxyMade
    static func makeProxy(_ style: Style) -> Proxy
}

extension MakeableByProxy where Self.Style == Self.Proxy.Style {
    public static func makeProxy(_ style: Style) -> Proxy {
        return Proxy.staticallyInitializeSinceLackOfEmptyInit(with: style)
    }
}

public protocol Styleable: ExpressibleByArrayLiteral {
    associatedtype StyleableAttribute: BaseAttribute
    associatedtype Style: StyleProtocol
}

public extension Styleable where Self.Style: AttributedStyleProtocol {
    typealias StyleableAttribute = Self.Style.Attribute
}

public extension Styleable where Self: Makeable, Self.SelfMakeable == Self {
    init(arrayLiteral elements: Self.StyleableAttribute...) {
        self = Self.make(elements)
    }
}

//extension Makeable {
//    public static func makeAndStyle(_ attributes: [Self.StyleableAttribute]) -> SelfMakeable {
//        let `self` = Self.make(attributes)
//        if let view = self as? UIView {
//            let style = Style.init(tuples: attributes.asTuples()) { (first, last) in last }
//            style.install(on: view)
//        }
//        return self
//    }
//}
public protocol SubKlass: AnyObject {
    associatedtype SuperKlassType
    func asSuper() -> SuperKlassType
}

extension Makeable where Self: MakeableByProxy, Self.Proxy: SubKlass, Self.Proxy.SuperKlassType == SelfMakeable {
    public static func make(_ style: Style) -> SelfMakeable {
        let `self` = Self.makeProxy(style).asSuper()
        if let view = self as? UIView {
            style.install(on: view)
        }
        return self
    }
}

extension Makeable where Self: EmptyInitializable, SelfMakeable == Self {
    public static func make(_ style: Style) -> SelfMakeable {
        let `self` = self.init()
        if let view = self as? UIView {
            style.install(on: view)
        }
        return self
    }
}

extension Makeable {
    /// Allow for use of array literals statically like this `UIButton.make(.text("foo"), .textColor(.red))`
    public static func make(_ elements: Self.StyleableAttribute...) -> SelfMakeable {
        return make(elements)
    }

    /// Allows for use of static instatiation like this: `UIButton.make([.text("foo"), .textColor(.red)])`
    public static func make(_ attributes: [Self.StyleableAttribute]) -> SelfMakeable {
        let style = Style.init(tuples: attributes.asTuples()) { (_, last) in last }
        return make(style)
    }
}

/// Makes (pun intended) it possible to write `let label: UILabel = make([.text("hi")])` notice the lack of `.` in `.make`.
public func make<M>(_ attributes: [M.StyleableAttribute]) -> M where M: Makeable, M.SelfMakeable == M {
    return M.make(attributes)
}
let label: UILabel = make([.numberOfLines(1)])

/// Makes (pun intended) it possible to write `let label: UILabel = make([.text("hi")])` notice the lack of `.` in `.make`.
public func make<M>(_ style: M.Style) -> M where M: Makeable, M.SelfMakeable == M {
    return M.make(style)
}
let label2: UILabel = make([.text("hi")])

/// Array literals support
//public func make<M: Makeable>(_ attributes: M.Attribute...) -> M {
//    return make(attributes)
//}
