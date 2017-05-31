//
//  Actor.swift
//  Breeze
//
//  Created by Alexander Cyon on 2017-05-29.
//  Copyright © 2017 Nordic Choice Hotels. All rights reserved.
//

import Foundation

struct Actor {
    let target: NSObject
    let selector: Selector
    let event: UIControlEvents
}

extension NSObject {
    func target(_ selector: Selector, event: UIControlEvents = .primaryActionTriggered) -> Actor {
        return Actor(target: self, selector: selector, event: event)
    }
}
