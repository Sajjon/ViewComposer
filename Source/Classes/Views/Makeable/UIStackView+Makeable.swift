//
//  UIStackView+Makeable.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-31.
//
//

import Foundation

extension UIStackView: Makeable {
    public typealias Style = ViewStyle
    public static func createEmpty() -> UIStackView {
        return UIStackView(frame: .zero)
    }
    
    public func postMake(_ style: Style) {
        setupArrangedSubviews(with: style)
    }
}

extension UIStackView {
    public func setupArrangedSubviews(with style: ViewStyle) {
        guard let optionalViews: [UIView?] = style.value(.views) else { return }
        let views: [UIView] = optionalViews.removeNils()
        views.forEach { addArrangedSubview($0) }
    }
}

protocol OptionalType {
    associatedtype Wrapped
    func map<U>(_ f: (Wrapped) throws -> U) rethrows -> U?
}

extension Optional: OptionalType {}

extension Sequence where Iterator.Element: OptionalType {
    func removeNils() -> [Iterator.Element.Wrapped] {
        var result: [Iterator.Element.Wrapped] = []
        for element in self {
            if let element = element.map({ $0 }) {
                result.append(element)
            }
        }
        return result
    }
}
