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
    
    public func postMake(_ style: Style) {
        ensureCorrectTitle(with: style)
        ensureCorrectImage(with: style)
    }
}

private extension UIButton {
    
    func ensureCorrectTitle(with style: Style) {
        guard
            style.contains(.text),
            let states: [ControlState] = style.value(.states)
            else { return }
        setControlStates(states)
    }
    
    func ensureCorrectImage(with style: Style) {
        guard
            style.contains(.image),
            let states: [ControlState] = style.value(.states)
            else { return }
        setControlStates(states)
    }
}
