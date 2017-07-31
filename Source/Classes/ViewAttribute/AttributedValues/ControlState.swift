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
    
    public init(title: String?, titleColor: UIColor?, image: UIImage?, borderColor: UIColor?) {
        self.title = title
        self.titleColor = titleColor
        self.image = image
        self.borderColor = borderColor
    }
}

extension ControlState {
    public convenience init(_ title: String) {
        self.init(title: title, titleColor: nil, image: nil, borderColor: nil)
    }
    
    public convenience init(_ title: String?, _ titleColor: UIColor?) {
        self.init(title: title, titleColor: titleColor, image: nil, borderColor: nil)
    }
    
    public convenience init(_ title: String?, _ image: UIImage?) {
        self.init(title: title, titleColor: nil, image: image, borderColor: nil)
    }
    
    public convenience init(_ title: String?, _ titleColor: UIColor?, _ image: UIImage?) {
        self.init(title: title, titleColor: titleColor, image: image, borderColor: nil)
    }
    
    public convenience init(_ titleColor: UIColor?) {
        self.init(title: nil, titleColor: titleColor, image: nil, borderColor: nil)
    }
    
    public convenience init(_ title: String?, _ titleColor: UIColor?, _ image: UIImage? = nil, borderColor: UIColor?) {
        self.init(title: title, titleColor: titleColor, image: image, borderColor: borderColor)
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
