//
//  BaseAttribute+Attributes.swift
//  ViewComposer1
//
//  Created by Alexander Cyon on 2018-04-25.
//  Copyright © 2018 cyon. All rights reserved.
//

import UIKit

public extension BaseAttribute {
    public static func backgroundColor<A>(_ value: UIColor) -> A where A: BaseAttributeProtocol {
        return A(name: .backgroundColor, value: value)
    }
    
    public static func clipsToBounds<A>(_ value: Bool) -> A where A: BaseAttributeProtocol {
        return A(name: .clipsToBounds, value: value)
    }
}
