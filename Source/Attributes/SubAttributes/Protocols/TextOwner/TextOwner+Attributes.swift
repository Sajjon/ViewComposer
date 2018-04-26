//
//  TextOwner+Attributes.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2018-04-27.
//

import Foundation

extension TextOwner where Self: BaseAttribute {
    public static func text<A>(_ value: String?) -> A where A: BaseAttribute {
        return A(name: .text, value: value as Any)
    }

    public static func textAlignment<A>(_ value: NSTextAlignment) -> A where A: LabelAttribute {
        return A(name: .textAlignment, value: value)
    }

    public static func textColor<A>(_ value: UIColor) -> A where A: LabelAttribute {
        return A(name: .textColor, value: value)
    }

    public static func font<A>(_ value: UIFont) -> A where A: LabelAttribute {
        return A(name: .font, value: value)
    }
}
