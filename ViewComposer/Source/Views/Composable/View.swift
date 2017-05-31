//
//  View.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-31.
//
//

import Foundation

open class MyView: UIView, Composable {
    public func setupSubviews(with style: ViewStyle) {
        print("remove this")
    }

    public typealias Style = ViewStyle
    open let style: ViewStyle

    required public init(_ style: ViewStyle? = nil) {
        let style = style.merge(slave: .default)
        self.style = style
        super.init(frame: .zero)
        compose(with: style)
    }
    
    required public init?(coder: NSCoder) { requiredInit() }
}

private extension ViewStyle {
    @nonobjc static let `default`: ViewStyle = [.backgroundColor(.clear)]
}
