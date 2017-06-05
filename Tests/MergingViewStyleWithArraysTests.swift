//
//  MergeResultingInViewStyleTests.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-05.
//
//


import XCTest
@testable import ViewComposer

class MergeResultingInViewStyleTests: XCTestCase {
    
    func testMergeCountMasterArray() {
        let attr1: ViewStyle = [.text(text), .backgroundColor(color)]
        let attr2: [ViewAttribute] = [.isHidden(isHidden)]
        let mergeMaster2 = attr1.merge(master: attr2)
        XCTAssert(mergeMaster2.count == 3)
        let mergeMaster1 = attr2.merge(master: attr1)
        XCTAssert(mergeMaster1.count == 3)
    }

    func testMergeCountSlaveArray() {
        let attr1: ViewStyle = [.text(text), .backgroundColor(color)]
        let attr2: [ViewAttribute] = [.isHidden(isHidden)]
        let mergeSlave2 = attr1.merge(slave: attr2)
        XCTAssert(mergeSlave2.count == 3)
        let mergeSlave1 = attr2.merge(slave: attr1)
        XCTAssert(mergeSlave1.count == 3)
    }
    
    func testMergeOperatorCountMasterArray() {
        let style: ViewStyle = [.text(text), .backgroundColor(color)]
        let attr2: [ViewAttribute] = [.isHidden(isHidden)]
        let mergeMaster2 = style <<- attr2
        XCTAssert(mergeMaster2.count == 3)
        let mergeMaster1 = attr2 <<- style
        XCTAssert(mergeMaster1.count == 3)
    }
    
    func testMergeOperatorCountSlaveArray() {
        let attr1: ViewStyle = [.text(text), .backgroundColor(color)]
        let attr2: [ViewAttribute] = [.isHidden(isHidden)]
        let mergeSlave2 = attr1 <- attr2
        XCTAssert(mergeSlave2.count == 3)
        let mergeSlave1 = attr2 <- attr1
        XCTAssert(mergeSlave1.count == 3)
    }
    

    func testMergeStyleWithArray() {
        let fooStyle: ViewStyle = [.text(foo), .backgroundColor(color)]
        let barAttr: [ViewAttribute] = [.text(bar), .isHidden(isHidden)]
        let fooMasterUsingSlave = fooStyle.merge(slave: barAttr)
        let fooMasterUsingMaster = barAttr.merge(master: fooStyle)
        let barMasterUsingSlave = barAttr.merge(slave: fooStyle)
        let barMasterUsingMaster = fooStyle.merge(master: barAttr)
        let attrs = [fooMasterUsingSlave, fooMasterUsingMaster, barMasterUsingSlave, barMasterUsingMaster]
        for attributes in attrs {
            XCTAssert(attributes.count == 3)
            XCTAssert(attributes.contains(.backgroundColor))
            XCTAssert(attributes.contains(.isHidden))
            XCTAssert(attributes.contains(.text))
        }
        XCTAssert(fooMasterUsingSlave.associatedValue(.text) == foo)
        XCTAssert(fooMasterUsingMaster.associatedValue(.text) == foo)
        XCTAssert(barMasterUsingSlave.associatedValue(.text) == bar)
        XCTAssert(barMasterUsingMaster.associatedValue(.text) == bar)
    }
    
    func testMergeStyleWithArrayOperators() {
        let fooStyle: ViewStyle = [.text(foo), .backgroundColor(color)]
        let barAttr: [ViewAttribute] = [.text(bar), .isHidden(isHidden)]
        let fooMasterUsingSlave = fooStyle <- barAttr
        let fooMasterUsingMaster = barAttr <<- fooStyle
        let barMasterUsingSlave = barAttr <- fooStyle
        let barMasterUsingMaster = fooStyle <<- barAttr
        let attrs = [fooMasterUsingSlave, fooMasterUsingMaster, barMasterUsingSlave, barMasterUsingMaster]
        for attributes in attrs {
            XCTAssert(attributes.count == 3)
            XCTAssert(attributes.contains(.backgroundColor))
            XCTAssert(attributes.contains(.isHidden))
            XCTAssert(attributes.contains(.text))
        }
        XCTAssert(fooMasterUsingSlave.associatedValue(.text) == foo)
        XCTAssert(fooMasterUsingMaster.associatedValue(.text) == foo)
        XCTAssert(barMasterUsingSlave.associatedValue(.text) == bar)
        XCTAssert(barMasterUsingMaster.associatedValue(.text) == bar)
    }
    
    func testStyleWithArrayTwoDoublets() {
        let fooStyle: ViewStyle = [.text(foo), .cornerRadius(fooRadius)]
        let barAttr: [ViewAttribute] = [.text(bar), .cornerRadius(barRadius)]
        let fooMasterUsingSlave = fooStyle.merge(slave: barAttr)
        let fooMasterUsingMaster = barAttr.merge(master: fooStyle)
        let barMasterUsingSlave = barAttr.merge(slave: fooStyle)
        let barMasterUsingMaster = fooStyle.merge(master: barAttr)
        let attrs = [fooMasterUsingSlave, fooMasterUsingMaster, barMasterUsingSlave, barMasterUsingMaster]
        for attributes in attrs {
            XCTAssert(attributes.count == 2)
            XCTAssert(attributes.contains(.cornerRadius))
            XCTAssert(attributes.contains(.text))
        }
        XCTAssert(fooMasterUsingSlave.associatedValue(.text) == foo)
        XCTAssert(fooMasterUsingMaster.associatedValue(.text) == foo)
        XCTAssert(barMasterUsingSlave.associatedValue(.text) == bar)
        XCTAssert(barMasterUsingMaster.associatedValue(.text) == bar)
        
        XCTAssert(fooMasterUsingSlave.associatedValue(.cornerRadius) == fooRadius)
        XCTAssert(fooMasterUsingMaster.associatedValue(.cornerRadius) == fooRadius)
        XCTAssert(barMasterUsingSlave.associatedValue(.cornerRadius) == barRadius)
        XCTAssert(barMasterUsingMaster.associatedValue(.cornerRadius) == barRadius)
    }
    
    func testMergeStyleWithArrayTwoDoubletsOperators() {
        let fooStyle: ViewStyle = [.text(foo), .cornerRadius(fooRadius)]
        let barAttr: [ViewAttribute] = [.text(bar), .cornerRadius(barRadius)]
        let fooMasterUsingSlave = fooStyle <- barAttr
        let fooMasterUsingMaster = barAttr <<- fooStyle
        let barMasterUsingSlave = barAttr <- fooStyle
        let barMasterUsingMaster = fooStyle <<- barAttr
        let attrs = [fooMasterUsingSlave, fooMasterUsingMaster, barMasterUsingSlave, barMasterUsingMaster]
        for attributes in attrs {
            XCTAssert(attributes.count == 2)
            XCTAssert(attributes.contains(.cornerRadius))
            XCTAssert(attributes.contains(.text))
        }
        XCTAssert(fooMasterUsingSlave.associatedValue(.text) == foo)
        XCTAssert(fooMasterUsingMaster.associatedValue(.text) == foo)
        XCTAssert(barMasterUsingSlave.associatedValue(.text) == bar)
        XCTAssert(barMasterUsingMaster.associatedValue(.text) == bar)
        
        XCTAssert(fooMasterUsingSlave.associatedValue(.cornerRadius) == fooRadius)
        XCTAssert(fooMasterUsingMaster.associatedValue(.cornerRadius) == fooRadius)
        XCTAssert(barMasterUsingSlave.associatedValue(.cornerRadius) == barRadius)
        XCTAssert(barMasterUsingMaster.associatedValue(.cornerRadius) == barRadius)
    }
    
 
    func testMergeStyleWithEmptyArray() {
        let fooStyle: ViewStyle = [.text(foo), .cornerRadius(fooRadius)]
        let barAttr: [ViewAttribute] = []
        let fooMasterUsingSlave = fooStyle.merge(slave: barAttr)
        let fooMasterUsingMaster = barAttr.merge(master: fooStyle)
        let barMasterUsingSlave = barAttr.merge(slave: fooStyle)
        let barMasterUsingMaster = fooStyle.merge(master: barAttr)
        let attrs = [fooMasterUsingSlave, fooMasterUsingMaster, barMasterUsingSlave, barMasterUsingMaster]
        for attributes in attrs {
            XCTAssert(attributes.count == 2)
            XCTAssert(attributes.contains(.cornerRadius))
            XCTAssert(attributes.contains(.text))
            XCTAssert(attributes.associatedValue(.text) == foo)
            XCTAssert(attributes.associatedValue(.cornerRadius) == fooRadius)
        }
    }

    func testMergeStyleWithEmptyArrayOperator() {
        let fooStyle: ViewStyle = [.text(foo), .cornerRadius(fooRadius)]
        let barAttr: [ViewAttribute] = []
        let fooMasterUsingSlave = fooStyle <- barAttr
        let fooMasterUsingMaster = barAttr <<- fooStyle
        let barMasterUsingSlave = barAttr <- fooStyle
        let barMasterUsingMaster = fooStyle <<- barAttr
        let attrs = [fooMasterUsingSlave, fooMasterUsingMaster, barMasterUsingSlave, barMasterUsingMaster]
        for attributes in attrs {
            XCTAssert(attributes.count == 2)
            XCTAssert(attributes.contains(.cornerRadius))
            XCTAssert(attributes.contains(.text))
            XCTAssert(attributes.associatedValue(.text) == foo)
            XCTAssert(attributes.associatedValue(.cornerRadius) == fooRadius)
        }
    }
    func testMergeStyleWithSingleAttribute() {
        let style: ViewStyle = [.text(foo), .cornerRadius(fooRadius)]
        let single: ViewAttribute = .backgroundColor(color)
        let arrayIsMasterUsingSlave = style.merge(slave: single)
        let arrayIsMasterUsingMaster = single.merge(master: style)
        let singleAttributeIsMasterUsingSlave = single.merge(slave: style)
        let singleAttributeIsMasterUsingMaster = style.merge(master: single)
        let attrs = [arrayIsMasterUsingSlave, arrayIsMasterUsingMaster, singleAttributeIsMasterUsingSlave, singleAttributeIsMasterUsingMaster]
        for attributes in attrs {
            XCTAssert(attributes.count == 3)
            XCTAssert(attributes.contains(.cornerRadius))
            XCTAssert(attributes.contains(.text))
            XCTAssert(attributes.contains(.backgroundColor))
            XCTAssert(attributes.associatedValue(.text) == foo)
            XCTAssert(attributes.associatedValue(.cornerRadius) == fooRadius)
        }
    }
    
    func testMergeStyleWithSingleAttributeOperator() {
        let style: ViewStyle = [.text(foo), .cornerRadius(fooRadius)]
        let single: ViewAttribute = .backgroundColor(color)
        let styleIsMasterUsingSlave = style <- single
        let styleIsMasterUsingMaster = single <<- style
        let singleAttributeIsMasterUsingSlave = single <- style
        let singleAttributeIsMasterUsingMaster = style <<- single
        let attrs = [styleIsMasterUsingSlave, styleIsMasterUsingMaster, singleAttributeIsMasterUsingSlave, singleAttributeIsMasterUsingMaster]
        for attributes in attrs {
            XCTAssert(attributes.count == 3)
            XCTAssert(attributes.contains(.cornerRadius))
            XCTAssert(attributes.contains(.text))
            XCTAssert(attributes.contains(.backgroundColor))
            XCTAssert(attributes.associatedValue(.text) == foo)
            XCTAssert(attributes.associatedValue(.cornerRadius) == fooRadius)
        }
    }
    
    
    func testMergeEmptyStyleWithSingleAttribute() {
        let style: ViewStyle = []
        let single: ViewAttribute = .text(foo)
        let styleIsMasterUsingSlave = style.merge(slave: single)
        let styleIsMasterUsingMaster = single.merge(master: style)
        let singleAttributeIsMasterUsingSlave = single.merge(slave: style)
        let singleAttributeIsMasterUsingMaster = style.merge(master: single)
        let attrs = [styleIsMasterUsingSlave, styleIsMasterUsingMaster, singleAttributeIsMasterUsingSlave, singleAttributeIsMasterUsingMaster]
        for attributes in attrs {
            XCTAssert(attributes.count == 1)
            XCTAssert(attributes.contains(.text))
            XCTAssert(attributes.associatedValue(.text) == foo)
        }
    }
    
    func testMergeEmptyStyleWithSingleAttributeOperator() {
        let style: ViewStyle = []
        let single: ViewAttribute = .text(foo)
        let styleIsMasterUsingSlave = style <- single
        let styleIsMasterUsingMaster = single <<- style
        let singleAttributeIsMasterUsingSlave = single <- style
        let singleAttributeIsMasterUsingMaster = style <<- single
        let attrs = [styleIsMasterUsingSlave, styleIsMasterUsingMaster, singleAttributeIsMasterUsingSlave, singleAttributeIsMasterUsingMaster]
        for attributes in attrs {
            XCTAssert(attributes.count == 1)
            XCTAssert(attributes.contains(.text))
            XCTAssert(attributes.associatedValue(.text) == foo)
        }
    }
    
    func testMergeStyleWithSingleAttributeDoublets() {
        let fooStyle: ViewStyle = [.text(foo), .cornerRadius(fooRadius)]
        let barSingle: ViewAttribute = .text(bar)
        let fooIsMasterUsingSlave = fooStyle.merge(slave: barSingle)
        let fooIsMasterUsingMaster = barSingle.merge(master: fooStyle)
        let barAttributeIsMasterUsingSlave = barSingle.merge(slave: fooStyle)
        let barAttributeIsMasterUsingMaster = fooStyle.merge(master: barSingle)
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
    
    func testMergeOperatorStyleWithSingleAttributeDoublets() {
        let fooStyle: ViewStyle = [.text(foo), .cornerRadius(fooRadius)]
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
}

