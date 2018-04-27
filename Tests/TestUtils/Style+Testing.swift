//
//  Style+Testing.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2018-04-27.
//

import UIKit
@testable import ViewComposer

extension StyleProtocol {
    func assertAttributeNamed<Value>(_ name: String, `is` expected: Value) where Value: Equatable {
        assertIs(attributes[name] as? Value, is: expected)
    }
}
