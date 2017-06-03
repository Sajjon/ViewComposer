//
//  BaseXCTest.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-31.
//
//

import Foundation
import XCTest

let text: String = "foobar"
let isHidden = true
let color: UIColor = .red
let cornerRadius: CGFloat = 3.1415
let spacing: CGFloat = 42
let image = UIImage()
let arrangedSubviews: [UIView] = [UILabel(), UIView(), UIButton()]

func assertIs<Value: Equatable>(_ optional: Value?, `is` expected: Value) {
    guard let actual = optional else {
        XCTFail("Value should not be nil")
        return
    }
    XCTAssert(actual == expected, "Expected '\(expected)', was: '\(actual)'")
}
