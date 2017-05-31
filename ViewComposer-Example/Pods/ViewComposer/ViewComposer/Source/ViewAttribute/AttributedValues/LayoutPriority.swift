//
//  LayoutPriority.swift
//  Breeze
//
//  Created by Alexander Cyon on 2017-05-29.
//  Copyright © 2017 Nordic Choice Hotels. All rights reserved.
//

import Foundation

enum LayoutPriority {
    case required
    case low
    case high
    case custom(Float)
}

extension LayoutPriority {
    var value: UILayoutPriority {
        switch self {
        case .required:
            return UILayoutPriorityRequired
        case .low:
            return UILayoutPriorityDefaultLow
        case .high:
            return UILayoutPriorityDefaultHigh
        case .custom(let prio):
            return prio
        }
    }
}
