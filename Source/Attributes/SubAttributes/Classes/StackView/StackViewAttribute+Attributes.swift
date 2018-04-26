//
//  StackViewAttribute+Attributes.swift
//  ViewComposer1
//
//  Created by Alexander Cyon on 2018-04-25.
//  Copyright © 2018 cyon. All rights reserved.
//

import UIKit

public extension StackViewAttribute {
    public static func arrangedSubviews<A>(_ value: [UIView]) -> A where A: StackViewAttribute {
        return A(name: .arrangedSubviews, value: value)
    }

    public static func axis<A>(_ value: UILayoutConstraintAxis) -> A where A: StackViewAttribute {
        return A(name: .axis, value: value)
    }

    public static func distribution<A>(_ value: UIStackViewDistribution) -> A where A: StackViewAttribute {
        return A(name: .distribution, value: value)
    }
}
