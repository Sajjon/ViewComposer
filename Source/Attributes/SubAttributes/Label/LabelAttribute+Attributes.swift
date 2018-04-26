//
//  LabelAttribute+Attributes.swift
//  ViewComposer1
//
//  Created by Alexander Cyon on 2018-04-22.
//  Copyright © 2018 cyon. All rights reserved.
//

import UIKit

public extension LabelAttribute {
    public static func numberOfLines<A>(_ value: Int) -> A where A: LabelAttribute {
        return A(name: .numberOfLines, value: value)
    }

    public static func text<A>(_ value: String?) -> A where A: LabelAttribute {
        return A(name: .text, value: value as Any)
    }

    public static func textColor<A>(_ value: UIColor) -> A where A: LabelAttribute {
        return A(name: .textColor, value: value)
    }

    public static func font<A>(_ value: UIFont) -> A where A: LabelAttribute {
        return A(name: .font, value: value)
    }

    public static func textAlignment<A>(_ value: NSTextAlignment) -> A where A: LabelAttribute {
        return A(name: .textAlignment, value: value)
    }
}

