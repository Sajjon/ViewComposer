//
//  Actor.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-31.
//
//

import Foundation

public struct Actor {
    let target: NSObject
    let selector: Selector
    let event: UIControlEvents
}

public extension NSObject {
    func target(_ selector: Selector, event: UIControlEvents = .primaryActionTriggered) -> Actor {
        return Actor(target: self, selector: selector, event: event)
    }
}
