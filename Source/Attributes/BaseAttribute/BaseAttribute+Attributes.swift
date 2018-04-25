//
//  BaseAttribute+Attributes.swift
//  ViewComposer1
//
//  Created by Alexander Cyon on 2018-04-25.
//  Copyright © 2018 cyon. All rights reserved.
//

import UIKit

public extension BaseAttribute {
    public static func backgroundColor<A>(_ color: UIColor) -> A where A: BaseAttribute {
        return A(name: .backgroundColor, value: color)
    }
}

