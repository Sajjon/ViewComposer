//
//  ControlState.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-31.
//
//

import UIKit

public class ControlState {
    public var state: UIControlState { fatalError("Override me") }
    
    public var title: String?
    public var titleColor: UIColor?
    public var image: UIImage?
    public var borderColor: UIColor?
    
    public init(title: String? = nil, titleColor: UIColor? = nil, image: UIImage? = nil, colorOfBorder borderColor: UIColor? = nil) {
        self.title = title
        self.titleColor = titleColor
        self.image = image
        self.borderColor = borderColor
    }
}

extension ControlState {
    
    public convenience init(_ title: String? = nil, _ titleColor: UIColor? = nil, _ image: UIImage? = nil, borderColor: UIColor? = nil) {
        self.init(title: title, titleColor: titleColor, image: image, colorOfBorder: borderColor)
    }
    
    public convenience init(_ title: String?, _ image: UIImage?) {
        self.init(title: title, titleColor: nil, image: image, colorOfBorder: nil)
    }
    
    public convenience init(_ titleColor: UIColor?) {
        self.init(title: nil, titleColor: titleColor, image: nil, colorOfBorder: nil)
    }
}

public class Normal: ControlState {
    public override var state: UIControlState { return .normal }
}

public class Highlighted: ControlState {
    public override var state: UIControlState { return .highlighted }
}

public class Disabled: ControlState {
    public override var state: UIControlState { return .disabled }
}

public class Selected: ControlState {
    public override var state: UIControlState { return .selected }
}

public class Focused: ControlState {
    public override var state: UIControlState { return .focused }
}

public class Application: ControlState {
    public override var state: UIControlState { return .application }
}

public class Reserved: ControlState {
    public override var state: UIControlState { return .reserved }
}
