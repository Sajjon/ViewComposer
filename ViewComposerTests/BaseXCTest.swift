//
//  BaseXCTest.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-31.
//
//

import Foundation
import XCTest

func assertIs<Value: Equatable>(_ optional: Value?, `is` expected: Value) {
    guard let actual = optional else {
        XCTFail("Value should not be nil")
        return
    }
    XCTAssert(actual == expected, "Expected '\(expected)', was: '\(actual)'")
}
