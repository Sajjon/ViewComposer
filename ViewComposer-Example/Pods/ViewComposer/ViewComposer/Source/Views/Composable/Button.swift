//
//  Button.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-31.
//
//

import UIKit

final class Button: UIButton {
    
    let style: ViewStyle
    
    init(_ style: ViewStyle? = nil) {
        let style = style.merge(slave: .default)
        self.style = style
        super.init(frame: .zero)
        setup(with: style)
    }
    
    required init?(coder: NSCoder) { requiredInit() }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutSubviews(with: style)
    }
}

extension Button: Composable {}

private extension ViewStyle {
    @nonobjc static let `default`: ViewStyle = [.radius(.rounded), .verticalHugging(.high), .verticalCompression(.high)]
}
