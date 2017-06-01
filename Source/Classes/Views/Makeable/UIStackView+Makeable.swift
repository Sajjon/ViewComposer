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
    func setupArrangedSubviews(with style: ViewStyle) {
        guard let views: [UIView] = style.value(.arrangedSubviews) else { return }
        views.forEach { addArrangedSubview($0) }
    }
}
