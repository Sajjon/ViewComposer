//
//  BaseAttribute.swift
//  ViewComposer1
//
//  Created by Alexander Cyon on 2018-04-25.
//  Copyright © 2018 cyon. All rights reserved.
//

import Foundation

public class BaseAttribute: BaseAttributeProtocol, CustomStringConvertible {
    public let name: String
    public let anyValue: Any

    public func value<V>() -> V? {
        return anyValue as? V
    }

    public required init(name: String, value: Any) {
        self.name = name
        self.anyValue = value
    }
}

// MARK: CustomStringConvertible
public extension BaseAttribute {
    var description: String {
        return name
    }
}
