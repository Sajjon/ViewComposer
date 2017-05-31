//
//  UIButton+Makeable.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-31.
//
//

import Foundation

extension UIButton: Makeable {
    public typealias Style = ViewStyle
    public typealias Styled = UIButton
    public static func make(_ attributes: [Style.Attribute]) -> UIButton {
        let button = UIButton(frame: .zero)
        button.setup(with: ViewStyle(attributes))
        return button
    }
}
