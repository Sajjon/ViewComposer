//
//  Styleable.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-31.
//
//

import Foundation

public protocol Styleable {
    associatedtype Style: Attributed
    func setup(with style: Style)
}

public protocol EmptyInitializable {
    associatedtype Styled
    static func createEmpty() -> Styled
}

public protocol Makeable: EmptyInitializable, Styleable {
    static func make(_ attributes: [Style.Attribute]) -> Styled
    func postMake(_ style: Style)
}

extension Makeable {
    
    public func postMake(_ style: Style) {}
    
    public static func make(_ attributes: [Style.Attribute]) -> Styled {
        let style = Style(attributes)
        return make(style)
    }
    
    public static func make(_ style: Style) -> Styled {
        let view: Styled = createEmpty()
        if let selfStylable = view as? Self {
            selfStylable.setup(with: style)
            selfStylable.postMake(style)
        }
        return view
    }
}

public protocol Composable: Styleable, ExpressibleByArrayLiteral {
    init(_ style: Style?)
    func setupSubviews(with style: Style)
}

extension Composable {
    public func setupSubviews(with style: Style) {}
}

public extension Composable {
    typealias Element = Style.Element
    init(arrayLiteral elements: Style.Attribute...) {
        self.init(Style(elements))
    }
}

public extension Styleable {
    func setup(with style: Style) {
        print("`\(self)` is calling func `setup` inside `public extension Styleable`")
        style.install(on: self)
    }
}

precedencegroup StyleablePrecedence {
    higherThan: CastingPrecedence
}

infix operator <<- : StyleablePrecedence
public func <<- <A: Attributed, C: Composable>(attributed: A, attribute: A.Attribute) -> C where C.Style == A {
    let style: A = attributed.merge(master: [attribute])
    return C(style)
}

public func <<- <A: Attributed, C: Composable>(attributed: A, attributes: [A.Attribute]) -> C where C.Style == A {
    let style: A = attributed.merge(master: attributes)
    return C(style)
}


infix operator <- : StyleablePrecedence
public func <- <A: Attributed, C: Composable>(attributed: A, attribute: A.Attribute) -> C where C.Style == A {
    let style: A = attributed.merge(slave: [attribute])
    return C(style)
}

public func <- <A: Attributed, C: Composable>(attributed: A, attributes: [A.Attribute]) -> C where C.Style == A {
    let style: A = attributed.merge(slave: attributes)
    return C(style)
}

public extension Composable where Self: UIView, Style == ViewStyle {
    func compose(with style: Style) {
        setup(with: style)
        setupSubviews(with: style)
    }
}

public extension Styleable where Self: UIView, Style == ViewStyle {
    func setup(with style: Style) {
        translatesAutoresizingMaskIntoConstraints = false
        style.install(on: self)
        setupConstraints(with: style)
    }
    
    
    func layoutSubviews(with style: Style) {
        privateLayoutSubviews(with: style)
        customLayoutSubviews(with: style)
    }
    
    func customLayoutSubviews(with style: Style) {}
}

public extension Styleable where Self: UIView, Style == ViewStyle {
    func privateLayoutSubviews(with style: Style) {
        guard let radius: Radius = style.value(.radius) else { return }
        setupRadius(radius)
    }
    
    func setupConstraints(with style: Style) {
        if let height: CGFloat = style.value(.height) {
            addConstraint(heightAnchor.constraint(equalToConstant: height))
        }
        
        if let width: CGFloat = style.value(.width) {
            addConstraint(widthAnchor.constraint(equalToConstant: width))
        }
    }
    
    func setupRadius(_ radius: Radius) {
        switch radius {
        case .rounded:
            layer.cornerRadius = bounds.height / 2
        }
    }
    
}

