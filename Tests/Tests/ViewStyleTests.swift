//
//  ViewStyleTests.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-31.
//
//

import Foundation
import XCTest
@testable import ViewComposer

class ViewStyleTests: XCTestCase {

    func testInitDictionary() {
        let dictionary: [String: Any] = [.backgroundColor: UIColor.test]
        let style = ViewStyle(attributes: dictionary)
        style.assertAttributeNamed(.backgroundColor, is: UIColor.test)
    }

    func testInitTuplesArrayUniquingKeysClosure() {
        let tuples: [(String, Any)] = [(.backgroundColor, UIColor.test)]
        let style = ViewStyle(tuples: tuples, uniquingKeysWith: LastValue)
        style.assertAttributeNamed(.backgroundColor, is: UIColor.test)
    }

    func testInitTuplesArrayUniqueKeysSuccess() {
        let tuples: [(String, Any)] = [(.backgroundColor, UIColor.test)]
        let style = ViewStyle(uniqueKeysWithValues: tuples)
        style.assertAttributeNamed(.backgroundColor, is: UIColor.test)
    }

    func testInitTuplesArrayUniqueKeysContaingDuplicatesExpectFatalError() {
        let tuplesContainingDuplicates: [(String, Any)] = [(.backgroundColor, UIColor.test), (.backgroundColor, UIColor.test)]
        expectFatalError(expectedMessage: duplicatesValueErrorMessage) {
            _ = ViewStyle(uniqueKeysWithValues: tuplesContainingDuplicates)
        }
    }

    func testInitBaseAttributeArray() {
        let style = ViewStyle(attributes: [.backgroundColor(.test)])
        style.assertAttributeNamed(.backgroundColor, is: UIColor.test)
    }

    func testExpressibleByArrayLiteral() {
        let style: ViewStyle = [.backgroundColor(.test)]
        style.assertAttributeNamed(.backgroundColor, is: UIColor.test)
    }


}
