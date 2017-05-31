//
//  TextView.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-31.
//
//

import UIKit

final class TextView: UITextView {
    
    let style: ViewStyle
    
    init(_ style: ViewStyle? = nil) {
        let style = style.merge(slave: .default)
        self.style = style
        super.init(frame: .zero, textContainer: nil)
        setup(with: style)
    }
    
    required init?(coder: NSCoder) { requiredInit() }
}

extension TextView: Styleable {}

private extension ViewStyle {
    @nonobjc static let `default`: ViewStyle = []
}

