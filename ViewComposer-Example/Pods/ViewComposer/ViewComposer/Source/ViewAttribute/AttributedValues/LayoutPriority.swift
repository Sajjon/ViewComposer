//
//  LayoutPriority.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-31.
//
//

import Foundation

public enum LayoutPriority {
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
