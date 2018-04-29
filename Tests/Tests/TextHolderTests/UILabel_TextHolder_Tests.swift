//
//  UILabel_TextHolder_Tests.swift
//  ViewComposerTests
//
//  Created by Alexander Cyon on 2018-04-29.
//

import Foundation
import XCTest
@testable import ViewComposer



class TextHolderTest: XCTestCase {

    let text = "Foo"
    let font = UIFont.boldSystemFont(ofSize: 1)
    let backgroundColor = UIColor.test
    let textColor = UIColor.test2
    let textAlignment = NSTextAlignment.center

    lazy var style: ViewStyle<TextAttribute> = [.text(text), .font(font), .textColor(textColor), .textAlignment(textAlignment), .backgroundColor(backgroundColor)]

    func assertCorrectMerge<S>(_ style: S) where S: StyleProtocol {
        assertIs(style.attribute(named: .text), is: text)
        assertIs(style.attribute(named: .font), is: font)
        assertIs(style.attribute(named: .backgroundColor), is: backgroundColor)
        assertIs(style.attribute(named: .textColor), is: textColor)
        assertIs(style.attribute(named: .textAlignment), is: textAlignment)
    }
}

class UILabelTextHolderTests: TextHolderTest {

    func testLabelTextHolderStyleMergingStyles() {
        let _labelStyleBase: LabelStyle = [.numberOfLines(1)]
        let labelStyle: LabelStyle = style.merging(_labelStyleBase)
        assertCorrectMerge(labelStyle)
    }

    func testLabelTextHolderStyleMergingStyleWithAttributes() {
        let labelStyle: LabelStyle = style.merging([.numberOfLines(7)])
        assertCorrectMerge(labelStyle)
        assertIs(labelStyle.attribute(named: .numberOfLines), is: 7)
    }

    func testLabelTextHolderStyleMergingStyleWithSingleAttribute() {
        let labelStyle: LabelStyle = style.merging(.numberOfLines(7))
        assertCorrectMerge(labelStyle)
        assertIs(labelStyle.attribute(named: .numberOfLines), is: 7)
    }
}
