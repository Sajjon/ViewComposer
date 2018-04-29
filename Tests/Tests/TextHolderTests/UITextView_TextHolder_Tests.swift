//
//  UITextView_TextHolder_Tests.swift
//  ViewComposerTests
//
//  Created by Alexander Cyon on 2018-04-29.
//

import Foundation
import XCTest
@testable import ViewComposer

class UITextViewTextHolderTests: TextHolderTest {

    func testTextViewTextHolderStyleMergingStyleWithAttributes() {
        let textViewStyle: TextViewStyle = style.merging(.isEditable(false))
        assertCorrectMerge(textViewStyle)
        assertIs(textViewStyle.attribute(named: .isEditable), is: false)
    }
}
