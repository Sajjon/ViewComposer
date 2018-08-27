//
//  Makeable.swift
//  ViewComposer1
//
//  Created by Alexander Cyon on 2018-04-25.
//  Copyright © 2018 cyon. All rights reserved.
//

import UIKit

public typealias Composable = Makeable & EmptyInitializable

public protocol EmptyInitializable {
    init()
}

public protocol Makeable: Styleable where SelfMakeable == Self {
    associatedtype SelfMakeable: Makeable
    static func make(_ attributes: [Self.Attribute]) -> SelfMakeable
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
    associatedtype Attribute: BaseAttribute
    associatedtype Style: StyleProtocol
}

public extension Styleable where Self.Style: AttributedStyleProtocol {
    typealias Attribute = Self.Style.Attribute
}

//public extension Styleable where Self: Makeable {
//    init(arrayLiteral elements: Self.Attribute...) {
//        self = Self.make(elements)
//    }
//}

public protocol SubMakeable: Makeable, SubKlass {}

public extension Makeable {
    init(arrayLiteral elements: Self.Attribute...) {
        self = Self.make(elements)
    }
}

public extension Makeable where Self: SubMakeable {
    init(arrayLiteral elements: Self.Attribute...) {
        self = Self.make(elements)
    }
}

extension Makeable {
    public static func make(_ elements: Self.Attribute...) -> SelfMakeable {
        return make(elements)
    }

    public static func make(_ attributes: [Self.Attribute]) -> SelfMakeable {
        let style = Style.init(tuples: attributes.asTuples()) { (_, last) in last }
        let `self` = make(style)
        if let view = self as? UIView {
            let style = Style.init(tuples: attributes.asTuples()) { (first, last) in last }
            style.install(on: view)
        }
        return self
    }

}

public protocol SubKlass: AnyObject {
    associatedtype SuperKlassType: Makeable
    func asSuper() -> SuperKlassType
}

extension MakeableByProxy where Self.Proxy: SubKlass {
    // The warning `Typealias overriding associated type SelfMakeable from protocol 'Makeable' is better expressed as same-type constraint`
    // action "FIX" will not work. Just messes up the code. So Xcode does not really help us here. This is what we want.
    public typealias SelfMakeable = Self.Proxy.SuperKlassType
}

extension Makeable where Self: MakeableByProxy, Self.Proxy: SubKlass, Self.Proxy.SuperKlassType == SelfMakeable {
    public static func make(_ style: Style) -> SelfMakeable {
        return Self.makeProxy(style).asSuper()
    }
}

extension Makeable where Self: EmptyInitializable, SelfMakeable == Self {
    public static func make(_ style: Style) -> SelfMakeable {
        return self.init()
    }
}

/// Makes (pun intended) it possible to write `let label: UILabel = make([.text("hi")])` notice the lack of `.` in `.make`.
/// let label: UILabel = make([.numberOfLines(1)])
public func make<M>(_ attributes: [M.Attribute]) -> M where M: Makeable {
    return M.make(attributes)
}

/// Makes (pun intended) it possible to write `let label: UILabel = make([.text("hi")])` notice the lack of `.` in `.make`.
/// let label: UILabel = make([.text("hi")])
public func make<M>(_ style: M.Style) -> M where M: Makeable {
    return M.make(style)
}

/// Array literals support
// let label: UILabel = make(.text("hi"), .numberOfLines(1))
public func make<M>(_ attributes: M.Attribute...) -> M where M: Makeable {
    return make(attributes)
}
