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

public protocol Makeable: Styleable {
    associatedtype Styled
    static func make(_ attributes: [Style.Attribute]) -> Styled
}

public protocol Composable: Styleable, ExpressibleByArrayLiteral {
    associatedtype Element = Style.Element
    init(_ style: Style?)

}

public extension Composable {
    init(arrayLiteral elements: Style.Attribute...) {
        self.init(Style(elements))
    }
}

public extension Styleable {
    func setup(with style: Style) {
        style.install(on: self)
    }
}

precedencegroup StyleablePrecedence {
    higherThan: CastingPrecedence
}

infix operator <<- : StyleablePrecedence

public func <<- <A: Attributed, C: Composable>(attributed: A, attributes: [A.Attribute]) -> C where C.Style == A {
    let style: A = attributed.merge(master: attributes)
    return C(style)
}

infix operator <- : StyleablePrecedence

public func <- <A: Attributed, C: Composable>(attributed: A, attributes: [A.Attribute]) -> C where C.Style == A {
    let style: A = attributed.merge(slave: attributes)
    return C(style)
}


public extension Styleable where Self: UIView {
    func setup(with style: ViewStyle) {
        translatesAutoresizingMaskIntoConstraints = false
        style.install(on: self)
        customSetup(with: style)
        setupConstraints(with: style)
    }
    
    func customSetup(with style: ViewStyle) {}
    
    func layoutSubviews(with style: ViewStyle) {
        privateLayoutSubviews(with: style)
        customLayoutSubviews(with: style)
    }
    
    func customLayoutSubviews(with style: ViewStyle) {}
}

public extension Styleable where Self: UIView {
    func privateLayoutSubviews(with style: ViewStyle) {
        guard let radius: Radius = style.value(.radius) else { return }
        setupRadius(radius)
    }
    
    func setupConstraints(with style: ViewStyle) {
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

