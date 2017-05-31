//
//  Button.swift
//  Breeze
//
//  Created by Alexander Cyon on 2017-04-19.
//  Copyright © 2017 Nordic Choice Hotels. All rights reserved.
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

extension Button: Styleable {}


/*
 titleLabel?.minimumScaleFactor = 0.01
 titleLabel?.adjustsFontSizeToFitWidth = true
 */
//
//extension ViewStyle {
//    @nonobjc static let buttonCyan = ViewStyle.default.union([.backgroundColor(.myCyan), .textColor(.darkBlue)])
//}
//
private extension ViewStyle {
    @nonobjc static let `default`: ViewStyle = [.radius(.rounded), .verticalHugging(.high), .verticalCompression(.high)]
}

