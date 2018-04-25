//
//  Attribute.swift
//  ViewComposer1
//
//  Created by Alexander Cyon on 2018-04-22.
//  Copyright © 2018 cyon. All rights reserved.
//

import Foundation

public protocol BaseAttributeProtocol {
    var name: String { get }
    var anyValue: Any { get }
    func value<V>() -> V?
    init(name: String, value: Any)
}

extension BaseAttributeProtocol {
    init(name: String) {
        self.init(name: name, value: ())
    }
}
