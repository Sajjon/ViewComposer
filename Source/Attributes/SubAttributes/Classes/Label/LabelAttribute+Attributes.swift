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
}

