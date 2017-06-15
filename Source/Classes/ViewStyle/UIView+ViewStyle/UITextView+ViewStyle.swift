//
//  UITextView+ViewStyle.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-15.
//
//

import Foundation

internal extension UITextView {
    func apply(_ style: ViewStyle) {
        style.attributes.forEach {
            switch $0 {
            case .selectedRange(let range):
                self.selectedRange = range
            default:
                break
            }
        }
    }
}
