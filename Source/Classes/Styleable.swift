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
    
    // Using ArrayLiterals
    public static func make(_ elements: Style.Attribute...) -> Styled {
        return make(elements)
    }
    
    public static func make(_ attributes: [Style.Attribute]) -> Styled {
        let style: Style = attributes.merge(slave: []) // do not allow duplicates
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

// Makes (pun intended) it possible to write `let label: UILabel = make([.text("hi")])` notice the lack of `.` in `.make`.
public func make<M: Makeable>(_ attributes: [M.Style.Attribute]) -> M where M.Styled == M {
    return M.make(attributes)
}

// Array literals support
public func make<M: Makeable>(_ attributes: M.Style.Attribute...) -> M where M.Styled == M {
    return make(attributes)
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
        style.install(on: self)
    }
}

precedencegroup StyleablePrecedence {
    higherThan: CastingPrecedence
    associativity: left
}

infix operator <- : StyleablePrecedence // merge operator returning `Styleable`
infix operator <<- : StyleablePrecedence // force merge operator returning `Styleable`

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

