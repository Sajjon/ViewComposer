//
//  View.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-31.
//
//

import Foundation

class View: UIView {
    let style: ViewStyle

    required init(_ style: ViewStyle? = nil) {
        let style = style.merge(slave: .default)
        self.style = style
        super.init(frame: .zero)
        setup(with: style)
    }
    
    required init?(coder: NSCoder) { requiredInit() }
}

extension View: Styleable {}

private extension ViewStyle {
    @nonobjc static let `default`: ViewStyle = [.backgroundColor(.clear)]
}
