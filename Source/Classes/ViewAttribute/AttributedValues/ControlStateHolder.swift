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

internal extension ControlStateHolder {
    func apply(_ style: ViewStyle) {
        style.attributes.forEach {
            switch $0 {
            case .states(let states):
                setControlStates(states)
            default:
                break
            }
        }
    }
}

extension UIButton: ControlStateHolder {
    @discardableResult
    @nonobjc public func setControlStates(_ states: [ControlState]) -> Self {
        states.forEach {
            configureControlState($0)
        }
        return self
    }
    
    func configureControlState(_ state: ControlState) {
        setTitle(state.title, for: state.state)
        setImage(state.image, for: state.state)
        setTitleColor(state.titleColor, for: state.state)
    }
}
