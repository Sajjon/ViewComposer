//
//  ControlStateHolder.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-31.
//
//

import Foundation

public protocol ControlStateHolder {
    @discardableResult func setControlStates(_ states: [ControlState]) -> Self
}

extension UIButton: ControlStateHolder {
    @discardableResult
    @nonobjc public func setControlStates(_ states: [ControlState]) -> Self {
        states.forEach {
            configureControlState(state: $0.state, with: $0.representation)
        }
        return self
    }
    
    func configureControlState(state: UIControlState, with representation: StateRepresentation) {
        setTitle(representation.0, for: state)
        setImage(representation.1, for: state)
    }
}
