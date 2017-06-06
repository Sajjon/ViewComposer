//
//  Composable+UIView.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-06.
//
//

import Foundation

public extension Composable where Self: UIView, Style == ViewStyle {
    func compose(with style: Style) {
        setup(with: style) /* Calling `setup` method in `Styleable` protocl */
        setupSubviews(with: style) /* Calling "optional" method in `Composable` */
    }
}
