//
//  AnyAttributed.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-02.
//
//

import Foundation

public struct AnyStrippable<_Stripped: StrippedRepresentation>: AssociatedValueStrippable, AssociatedValueEnumExtractor {
    public var associatedValue: Any? { return _getAssociatedValue }
    private let _getAssociatedValue: () -> Any?
    
    public typealias Stripped = _Stripped
    
    public var stripped: Stripped { return _getStripped() }
    private let _getStripped: () -> Stripped
    
    public init<Concrete: AssociatedValueStrippable & AssociatedValueEnumExtractor>(_ concrete: Concrete) where Concrete.Stripped == Stripped {
        _getStripped = { concrete.stripped }
        _getAssociatedValue = { concrete.associatedValue }
    }
}

extension AnyStrippable: Equatable {
    public static func == (lhs: AnyStrippable, rhs: AnyStrippable) -> Bool {
        return lhs.stripped == rhs.stripped
    }
}

public struct AnyAttributed<_Attribute: AssociatedValueStrippable & AssociatedValueEnumExtractor>: Attributed {
    public typealias Attribute = _Attribute
    
    public var attributes: [Attribute] { return _getAttributes() }
    public var startIndex: Int { return _getStartIndex() }
   
    private let _getStartIndex: () -> Int
    private let _getAttributes: () -> [Attribute]
    private let _install: (Any) -> Void
    
    public init<Concrete: Attributed>(concrete: Concrete) where Concrete.Attribute == Attribute {
        _getStartIndex = { concrete.startIndex }
        _getAttributes = { concrete.attributes }
        _install = { concrete.install(on: $0) }
    }
    
    public init(_ attributes: [Attribute]) {
        useConcrete()
    }
    
    public init(arrayLiteral elements: Attribute...) {
        useConcrete()
    }
    
    public func install(on styleable: Any) {
        _install(on: styleable)
    }
    
}

private func useConcrete() -> Never {
    fatalError("Use concrete")
}
