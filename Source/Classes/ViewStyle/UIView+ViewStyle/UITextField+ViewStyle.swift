//
//  UITextField+ViewStyle.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-15.
//
//

import Foundation

internal extension UITextField {
    func apply(_ style: ViewStyle) {
        style.attributes.forEach {
            switch $0 {
            case .clearButtonMode(let clearButtonMode):
                self.clearButtonMode = clearButtonMode
            case .borderStyle(let borderStyle):
                self.borderStyle = borderStyle
            default:
                break
            }
        }
    }
}
