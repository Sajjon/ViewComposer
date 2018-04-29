//
//  TextViewAttribute+Attributes.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2018-04-27.
//

import UIKit

public extension TextViewAttribute {
    static func isEditable<A>(_ value: Bool) -> A where A: TextViewAttribute {
        return A(name: .isEditable, value: value)
    }

    static func isSelectable<A>(_ value: Bool) -> A where A: TextViewAttribute {
        return A(name: .isSelectable, value: value)
    }

}
