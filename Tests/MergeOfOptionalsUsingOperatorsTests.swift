//
//  MergeOfOptionalsUsingOperatorsTests.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-08.
//
//

import XCTest
@testable import ViewComposer

class MergeOfOptionalsUsingOperatorsTests: XCTestCase {
    
    func testMergeOfAttributeIntoOptionalStyleWithValue() {
        let fooStyle: ViewStyle? = [.text(foo), .cornerRadius(fooRadius)]
        let barSingle: ViewAttribute = .text(bar)
        let fooIsMasterUsingSlave = fooStyle <- barSingle
        let fooIsMasterUsingMaster = barSingle <<- fooStyle
        let barAttributeIsMasterUsingSlave = barSingle <- fooStyle
        let barAttributeIsMasterUsingMaster = fooStyle <<- barSingle
        let attrs = [fooIsMasterUsingSlave, fooIsMasterUsingMaster, barAttributeIsMasterUsingSlave, barAttributeIsMasterUsingMaster]
        for attributes in attrs {
            XCTAssert(attributes.count == 2)
            XCTAssert(attributes.contains(.cornerRadius))
            XCTAssert(attributes.contains(.text))
        }
        XCTAssert(fooIsMasterUsingSlave.associatedValue(.text) == foo)
        XCTAssert(fooIsMasterUsingMaster.associatedValue(.text) == foo)
        XCTAssert(barAttributeIsMasterUsingSlave.associatedValue(.text) == bar)
        XCTAssert(barAttributeIsMasterUsingMaster.associatedValue(.text) == bar)
    }
    
    func testMergeOfAttributeIntoOptionalStyleBeingNil() {
        let nilStyle: ViewStyle? = nil
        let barSingle: ViewAttribute = .text(bar)
        let nilIsMasterUsingSlave = nilStyle <- barSingle
        let nilIsMasterUsingMaster = barSingle <<- nilStyle
        let barAttributeIsMasterUsingSlave = barSingle <- nilStyle
        let barAttributeIsMasterUsingMaster = nilStyle <<- barSingle
        let attrs = [nilIsMasterUsingSlave, nilIsMasterUsingMaster, barAttributeIsMasterUsingSlave, barAttributeIsMasterUsingMaster]
        for attributes in attrs {
            XCTAssertNotNil(attributes)
            XCTAssert(attributes.count == 1)
            XCTAssert(attributes.contains(.text))
            XCTAssert(attributes.associatedValue(.text) == bar)
        }
    }
}
