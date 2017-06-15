//
//  ThumbTintColorOwner.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-11.
//
//

import Foundation

public protocol ThumbTintColorOwner: class {
    var thumbTintColorProxy: UIColor? { get set}
}

extension ThumbTintColorOwner {
    @discardableResult
    func setThumbTintColor(_ tintColor: UIColor?) -> Self {
        thumbTintColorProxy = tintColor
        return self
    }
}

extension UISlider: ThumbTintColorOwner {
    public var thumbTintColorProxy: UIColor? {
        get { return thumbTintColor }
        set { thumbTintColor = newValue }
    }
}

extension UISwitch: ThumbTintColorOwner {
    public var thumbTintColorProxy: UIColor? {
        get { return thumbTintColor }
        set { thumbTintColor = newValue }
    }
}

internal extension ThumbTintColorOwner {
    func apply(_ style: ViewStyle) {
        style.attributes.forEach {
            switch $0 {
            case .thumbTintColor(let color):
                setThumbTintColor(color)
            default:
                break
            }
        }
    }
}
