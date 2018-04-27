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

public protocol ProxyMade: Styleable {
    static func staticallyInitializeSinceLackOfEmptyInit(with attributes: [Self.StyleableAttribute]) -> Self
}

public protocol MakeableByProxy: Makeable {
    associatedtype Proxy: ProxyMade & SubKlass
    static func makeProxy(_ attributes: [Self.StyleableAttribute]) -> Proxy
}

extension MakeableByProxy where Self.StyleableAttribute == Self.Proxy.StyleableAttribute {
    public static func makeProxy(_ attributes: [Self.StyleableAttribute]) -> Proxy {
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

public extension Styleable where Self: Makeable, Self.SelfMakeable == Self {
    init(arrayLiteral elements: Self.StyleableAttribute...) {
        self = Self.makeAndStyle(elements)
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

public protocol SuperKlass: AnyObject {
    associatedtype SubKlassType: SubKlass & UIView
}

public protocol SubKlass: AnyObject {
    associatedtype SuperKlassType: SuperKlass & UIView
    func asSuper() -> SuperKlassType
}

extension UICollectionView: SuperKlass {
    public typealias SubKlassType = CollectionView
}

extension CollectionView: SubKlass {
    public typealias SuperKlassType = UICollectionView
    public func asSuper() -> SuperKlassType { return self as SuperKlassType }
}

extension Makeable where Self: SuperKlass, Self: MakeableByProxy, Self.SubKlassType == Self.Proxy, Self.Proxy.SuperKlassType == SelfMakeable {
    public static func make(_ attributes: [Self.StyleableAttribute]) -> SelfMakeable {
        let made: Self.SubKlassType = Self.makeProxy(attributes)
        return made.asSuper()
    }
}

extension Makeable where Self: EmptyInitializable, SelfMakeable == Self {
    public static func make(_ attributes: [Self.StyleableAttribute]) -> SelfMakeable {
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
let label: UILabel = make([.numberOfLines(1)])
// Makes (pun intended) it possible to write `let label: UILabel = make([.text("hi")])` notice the lack of `.` in `.make`.
public func make<M>(_ attributes: [M.StyleableAttribute]) -> M where M: Makeable, M.SelfMakeable == M {
    return M.make(attributes)
}
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
