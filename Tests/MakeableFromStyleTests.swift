//
//  MakeableFromStyleTests.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-05.
//
//

import XCTest
@testable import ViewComposer

class MakeableFromStyleTests: XCTestCase {
    
    private let style: ViewStyle = [.text(foo), .backgroundColor(color)]
    func testMakingLabelFromMergeBetweenStyleAndSingleAttribute() {
        let label: UILabel = style <<- .text(bar)
        assertIs(label.text, is: bar)
        assertIs(label.backgroundColor, is: color)
    }
    
    func testMakingLabelFromMergeBetweenStyleAndAttributeArray() {
        let label: UILabel = style <<- [.text(bar), .textAlignment(.center)]
        assertIs(label.text, is: bar)
        assertIs(label.backgroundColor, is: color)
        assertIs(label.textAlignment, is: .center)
    }
    
    func testMakingLabelFromMergeBetweenSingleAttributeAndStyle() {
        let label: UILabel = .text(bar) <- style
        assertIs(label.text, is: bar)
        assertIs(label.backgroundColor, is: color)
    }
    
    func testMakingLabelFromMergeBetweenAttributeArrayAndStyle() {
        let label: UILabel =  [.text(bar), .textAlignment(.center)] <- style
        assertIs(label.text, is: bar)
        assertIs(label.backgroundColor, is: color)
        assertIs(label.textAlignment, is: .center)
    }
}
