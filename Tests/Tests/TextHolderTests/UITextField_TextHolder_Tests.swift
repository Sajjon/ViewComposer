//
//  UITextField_TextHolder_Tests.swift
//  ViewComposerTests
//
//  Created by Alexander Cyon on 2018-04-29.
//

import Foundation
import XCTest
@testable import ViewComposer

class UITextFieldTextHolderTests: TextHolderTest {

    func testTextFieldTextHolderStyleMergingStyleWithAttributes() {
        let placeholder = "qwerty"
        let textFieldStyle: TextFieldStyle = style.merging(.placeholder(placeholder))
        assertCorrectMerge(textFieldStyle)
        assertIs(textFieldStyle.attribute(named: .placeholder), is: placeholder)
    }
}
