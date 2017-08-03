//
//  ControlStateHolder.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-31.
//
//

import Foundation

public protocol ControlStateHolder {
    func setControlStates(_ states: [ControlState])
}

extension UIButton: ControlStateHolder {
    @nonobjc public func setControlStates(_ states: [ControlState]) {
        ifNeededSetTitleForNonNormalStates(states)
        states.forEach {
            configureControlState($0)
        }
    }
}

internal extension UIButton {
    func configureControlState(_ state: ControlState) {
        setTitle(state.title, for: state.state)
        setImage(state.image, for: state.state)
        setTitleColor(state.titleColor, for: state.state)
        setBorderColor(state.borderColor)
    }
    
    @nonobjc func setBorderColor(_ borderColor: UIColor?) {
        guard let borderColor = borderColor else { return }
        setBorderColor(borderColor.cgColor)
    }
    
    @nonobjc func setBorderColor(_ borderColor: CGColor) {
        layer.borderColor = borderColor
    }
    
    func ifNeededSetTitleForNonNormalStates(_ states: [ControlState]) {
        guard let title = normalTitle(from: states) else { return }
        states.filter { $0.title == nil }.forEach { $0.title = title }
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
