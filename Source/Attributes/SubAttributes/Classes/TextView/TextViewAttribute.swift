//
//  TextViewAttribute.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2018-04-27.
//

import UIKit

open class ScrollViewAttribute: BaseAttribute {}

public extension String {
    static var contentInsetAdjustmentBehavior: String { return #function }
}

public extension ScrollViewAttribute {
    static func contentInsetAdjustmentBehavior<A>(_ value: UIScrollViewContentInsetAdjustmentBehavior) -> A where A: ScrollViewAttribute {
        return A(name: .contentInsetAdjustmentBehavior, value: value)
    }
}

open class TextViewAttribute: ScrollViewAttribute {}
extension TextViewAttribute: TextOwner {}
