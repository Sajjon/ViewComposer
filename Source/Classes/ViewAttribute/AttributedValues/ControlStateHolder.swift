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
        let processed = processStates(states)
        processed.forEach {
            configureControlState($0)
        }
        return self
    }
    
    func configureControlState(_ state: ControlState) {
        setTitle(state.title, for: state.state)
        setImage(state.image, for: state.state)
        setTitleColor(state.titleColor, for: state.state)
    }
    
    func processStates(_ states: [ControlState]) -> [ControlState] {
        guard let title = normalTitle(from: states) else { return states }
        var states = states
        states = ifNeededSetTitle(title, forStateOfType: Highlighted.self, in: states)
        states = ifNeededSetTitle(title, forStateOfType: Disabled.self, in: states)
        states = ifNeededSetTitle(title, forStateOfType: Selected.self, in: states)
        states = ifNeededSetTitle(title, forStateOfType: Focused.self, in: states)
        states = ifNeededSetTitle(title, forStateOfType: Application.self, in: states)
        states = ifNeededSetTitle(title, forStateOfType: Reserved.self, in: states)
        return states
    }
    
    func ifNeededSetTitle<C: ControlState>(_ title: String, forStateOfType stateType: C.Type, in states: [ControlState]) -> [ControlState] {
        var states = states
        var alteredState: C?
        var indexOfStateToRemove = 0
        for (index, state) in states.enumerated() {
            guard
                type(of: state) == stateType,
                state.title == nil,
                let titleColor = state.titleColor
            else { continue }
            indexOfStateToRemove = index
            alteredState = C.init(title: title, titleColor: titleColor, image: state.image)
            break
        }
        guard let altered = alteredState else { return states }
        states.remove(at: indexOfStateToRemove)
        states.append(altered)
        return states
    }
    
    func normalTitle(from states: [ControlState]) -> String? {
        var normalTitle: String?
        for state in states {
            guard state is Normal else { continue }
            normalTitle = state.title
        }
        return normalTitle
    }
}
