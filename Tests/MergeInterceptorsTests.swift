//
//  MergeInterceptors.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-25.
//
//

import Foundation

import XCTest
@testable import ViewComposer

class MergeInterceptorsTests: BaseXCTest {
        
    func testCustomAttributeMergingOperator() {
        ViewStyle.mergeInterceptors.append(FooBarViewAttributeMerger.self)
        let bar = 237
        let baseStyle: ViewStyle = [.foo(fooText)]
        let style: ViewStyle = baseStyle <<- .bar(bar)
        guard let foobarViewStyle: FooBarViewStyle = style.value(.custom) else { XCTAssert(false); return }
        XCTAssert(foobarViewStyle.count == 2)
        XCTAssert(foobarViewStyle.value(.bar) == bar)
        XCTAssert(foobarViewStyle.value(.foo) == fooText)
    }
    
    func testCustomAttributeMergingIntercepting() {
        ViewStyle.mergeInterceptors.append(FooBarViewAttributeMerger.self)
        let bar = 237
        let baseStyle: ViewStyle = [.foo(fooText)]
        let style: ViewStyle = baseStyle.merge(master: .bar(bar))
        guard let foobarViewStyle: FooBarViewStyle = style.value(.custom) else { XCTAssert(false); return }
        XCTAssert(foobarViewStyle.count == 2)
        XCTAssert(foobarViewStyle.value(.bar) == bar)
        XCTAssert(foobarViewStyle.value(.foo) == fooText)
    }
    
    
    func testCustomAttributeMergingNotIntercepting() {
        ViewStyle.mergeInterceptors.append(FooBarViewAttributeMerger.self)
        let bar = 237
        let baseStyle: ViewStyle = [.foo(fooText)]
        let style: ViewStyle = baseStyle.merge(master: .bar(bar), intercept: false)
        guard let foobarViewStyle: FooBarViewStyle = style.value(.custom) else { XCTAssert(false); return }
        XCTAssert(foobarViewStyle.count == 1)
        XCTAssert(foobarViewStyle.value(.bar) == bar)
    }
}

struct FooBarViewAttributeMerger: MergeInterceptor {
    static func interceptMerge<A>(master masterAttributed: A, slave: A) -> A where A : Attributed {
        guard
            let master = masterAttributed as? ViewStyle,
            let slave = slave as? ViewStyle,
            let masterFooBar: FooBarViewStyle = master.value(.custom),
            let slaveFooBar: FooBarViewStyle = slave.value(.custom)
            else { return masterAttributed }
        let merged = masterFooBar.merge(slave: slaveFooBar, intercept: false)
        return ViewStyle([.custom(merged)]) as! A
    }
}

public enum FooBarViewAttribute {
    case foo(String)
    case bar(Int)
}

protocol FooBarViewStyleable {
    var foo: String? { get set }
    var bar: Int? { get set }
}

extension UITextField: FooBarViewStyleable {
    
    var foo: String? {
        set { placeholder = newValue }
        get { return placeholder }
    }
    
    var bar: Int? {
        set { text = "\(newValue!)" }
        get {
            guard let text = text else { return nil }
            return Int(text)
        }
    }
}

extension ViewAttribute {
    static func foo(_ foo: String) -> ViewAttribute {
        return .foobar(.foo(foo))
    }
    
    static func bar(_ bar: Int) -> ViewAttribute {
        return .foobar(.bar(bar))
    }
    
    static func foobar(_ attribute: FooBarViewAttribute) -> ViewAttribute {
        return .custom(FooBarViewStyle([attribute]))
    }
}

public struct FooBarViewStyle: Attributed {
    public static var mergeInterceptors: [MergeInterceptor.Type] = []
    public static var duplicatesHandler: AnyDuplicatesHandler<FooBarViewStyle>?
    
    public var startIndex: Int = 0
    public let attributes: [FooBarViewAttribute]
    
    public init(_ attributes: [FooBarViewAttribute]) {
        self.attributes = attributes
    }
    
    public init(arrayLiteral elements: FooBarViewAttribute...) {
        self.attributes = elements
    }
    
    public func install(on styleable: Any) {
        guard var fooBarStyleable = styleable as? FooBarViewStyleable else { return }
        attributes.forEach {
            switch $0 {
            case .foo(let foo):
                fooBarStyleable.foo = foo
            case .bar(let bar):
                fooBarStyleable.bar = bar
            }
        }
    }
}

//MARK: Making FooBarViewAttribute AssociatedValueStrippable, typically we want to automate this using `Sourcery`...
extension FooBarViewAttribute: Equatable {
    public static func == (lhs: FooBarViewAttribute, rhs: FooBarViewAttribute) -> Bool {
        return lhs.stripped == rhs.stripped
    }
}

extension FooBarViewAttribute: AssociatedValueEnumExtractor {
    public var associatedValue: Any? {
        switch self {
        case .foo(let foo):
            return foo
        case .bar(let bar):
            return bar
        }
    }
}

extension FooBarViewAttribute: AssociatedValueStrippable {
    public typealias Stripped = FooBarViewAttributeStripped
    public var stripped: Stripped {
        let stripped: Stripped
        switch self {
        case .foo:
            stripped = .foo
        case .bar:
            stripped = .bar
        }
        return stripped
    }
}

public enum FooBarViewAttributeStripped: String, StrippedRepresentation {
    case foo, bar
}

