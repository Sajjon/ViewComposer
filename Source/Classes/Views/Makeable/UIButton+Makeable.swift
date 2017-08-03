//
//  UIButton+Makeable.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-31.
//
//

import Foundation

extension UIButton: Makeable {
    public typealias Style = ViewStyle
    public static func createEmpty() -> UIButton {
        return UIButton(frame: .zero)
    }
    
    public func postMake(_ style: ViewStyle) {
        ensureCorrectTitle(with: style)
        ensureCorrectImage(with: style)
        setBorderColorIfNeeded(with: style)
    }
}

private extension UIButton {
    
    func ensureCorrectTitle(with style: ViewStyle) {
        guard
            style.contains(.text),
            let states: [ControlState] = style.value(.states)
            else { return }
        setControlStates(states)
    }
    
    func ensureCorrectImage(with style: ViewStyle) {
        guard
            style.contains(.image),
            let states: [ControlState] = style.value(.states)
            else { return }
        setControlStates(states)
    }
    
    func setBorderColorIfNeeded(with style: ViewStyle) {
        guard
            let states: [ControlState] = style.value(.states),
            let normal = states.filter({ $0.state == .normal }).first,
            let borderColor = normal.borderColor
            else { return }
        layer.borderColor = borderColor.cgColor
    }
}
