//
//  Label.swift
//  Breeze
//
//  Created by William Lind Nilsson on 2017-04-21.
//  Copyright © 2017 Nordic Choice Hotels. All rights reserved.
//

import Foundation

final class Label: UILabel {
    
    let style: ViewStyle
    
    init(_ style: ViewStyle? = nil) {
        let style = style.union(.default)
        self.style = style
        super.init(frame: .zero)
        setup(with: style)
    }
    
    required init?(coder: NSCoder) { requiredInit() }
    
}

extension Label: ViewStyleable {}

private extension ViewStyle {
    @nonobjc static let `default`: ViewStyle = .empty
}
