//
//  UIStackView+Makeable.swift
//  ViewComposer1
//
//  Created by Alexander Cyon on 2018-04-25.
//  Copyright © 2018 cyon. All rights reserved.
//

import UIKit

extension UIStackView: Makeable {
    public typealias Style = StackViewStyle
    public typealias Attribute = StackViewAttribute
    public static func createEmpty() -> UIStackView {
        return UIStackView(frame: .zero)
    }
}

