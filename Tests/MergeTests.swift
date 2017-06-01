//
//  MergeTests.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-01.
//
//

import XCTest
@testable import ViewComposer

class MergeTests: XCTestCase {
    func testMergeArray() {
        
        let attr1: [ViewAttribute] = [.text(text), .backgroundColor(color)]
        let attr2: [ViewAttribute] = [.isHidden(isHidden)]
        let mergeMaster2 = attr1.merge(master: attr2)
        XCTAssert(mergeMaster2.count == 3)
        let mergeMaster1 = attr2.merge(master: attr1)
        XCTAssert(mergeMaster1.count == 3)
    }
}
    
