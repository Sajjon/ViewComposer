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
    public init(_ target: NSObject, selector: Selector, event: UIControlEvents = .primaryActionTriggered) {
        self.target = target
        self.selector = selector
        self.event = event
    }
}

public extension NSObject {
    func target(_ selector: Selector, event: UIControlEvents = .primaryActionTriggered) -> Actor {
        return Actor(self, selector: selector, event: event)
    }
}
