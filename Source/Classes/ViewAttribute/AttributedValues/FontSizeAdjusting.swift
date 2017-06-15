//
//  FontSizeAdjusting.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-10.
//
//


import UIKit

public protocol FontSizeAdjusting: class {
    var adjustsFontSizeProxy: Bool { get set}
}

extension FontSizeAdjusting {
    @discardableResult
    func setAdjustsFontSizeToFitWidth(_ adjusts: Bool) -> Self {
        adjustsFontSizeProxy = adjusts
        return self
    }
}

extension UILabel: FontSizeAdjusting {
    public var adjustsFontSizeProxy: Bool {
        get { return adjustsFontSizeToFitWidth }
        set { adjustsFontSizeToFitWidth = newValue }
    }
}

extension UITextField: FontSizeAdjusting {
    public var adjustsFontSizeProxy: Bool {
        get { return adjustsFontSizeToFitWidth }
        set { adjustsFontSizeToFitWidth = newValue }
    }
}

internal extension FontSizeAdjusting {
    func apply(_ style: ViewStyle) {
        style.attributes.forEach {
            switch $0 {
            case .adjustsFontSizeToFitWidth(let adjusts):
                setAdjustsFontSizeToFitWidth(adjusts)
            default:
                break
            }
        }
    }
}
