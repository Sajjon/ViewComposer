//
//  UISwitch+Makeable.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-11.
//
//

import Foundation

extension UISwitch: Makeable {
    public typealias Style = ViewStyle
    public static func createEmpty() -> UISwitch {
        return UISwitch(frame: .zero)
    }
}
