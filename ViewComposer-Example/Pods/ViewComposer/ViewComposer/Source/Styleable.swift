//
//  Styleable.swift
//  Pods
//
//  Created by Alexander Cyon on 2017-05-29.
//
//

import Foundation

public protocol Styleable: ExpressibleByArrayLiteral {
    associatedtype Style: Attributed
    var style: Style { get }
    init(_ style: Style?)
    associatedtype Element = Style.Element
}

public extension Styleable {
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

func <<- <A: Attributed, S: Styleable>(attributed: A, attributes: [A.Attribute]) -> S where S.Style == A {
    let style: A = attributed.merge(master: attributes)
    return S(style)
}

infix operator <- : StyleablePrecedence

func <- <A: Attributed, S: Styleable>(attributed: A, attributes: [A.Attribute]) -> S where S.Style == A {
    let style: A = attributed.merge(slave: attributes)
    return S(style)
}


extension Styleable where Self: UIView {
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

private extension Styleable where Self: UIView {
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

