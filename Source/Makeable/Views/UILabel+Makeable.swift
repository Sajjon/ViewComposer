//
//  UILabel+Makeable.swift
//  ViewComposer1
//
//  Created by Alexander Cyon on 2018-04-25.
//  Copyright © 2018 cyon. All rights reserved.
//

import UIKit

extension UILabel: Makeable {
    public typealias Style = LabelStyle
    public typealias Attribute = LabelAttribute
    public static func createEmpty() -> UILabel {
        return UILabel(frame: .zero)
    }
}

