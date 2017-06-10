//
//  Targetable.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-10.
//
//

import Foundation

public protocol Targetable: class {
    var isEnabledProxy: Bool { get set}
    var isSelectedProxy: Bool { get set}
    var isHighlighedProxy: Bool { get set}
    func addTarget(using actor: Actor)
}

extension Targetable {
    @discardableResult
    func setEnabled(_ enabled: Bool) -> Self {
        isEnabledProxy = enabled
        return self
    }
    
    @discardableResult
    func setSelected(_ selected: Bool) -> Self {
        isSelectedProxy = selected
        return self
    }
    
    @discardableResult
    func setHighlighted(_ highlighted: Bool) -> Self {
        isHighlighedProxy = highlighted
        return self
    }
}

extension UIControl: Targetable {
    
    public var isEnabledProxy: Bool {
        get { return isEnabled }
        set { isEnabled = newValue }
    }
    
    public var isSelectedProxy: Bool {
        get { return isSelected }
        set { isSelected = newValue }
    }
    
    public var isHighlighedProxy: Bool {
        get { return isHighlighted }
        set { isHighlighted = newValue }
    }
    
    public func addTarget(using actor: Actor) {
        addTarget(actor.target, action: actor.selector, for: actor.event)
    }
}
