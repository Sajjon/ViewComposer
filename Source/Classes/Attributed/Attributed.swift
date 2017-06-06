//
//  Attributed.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-31.
//
//

import Foundation

/// Type that holds a collection of attributes used to style some `Styleable`. This collection can be merged with another instance of it sharing the same `Attribute` associatedtype. You can also extract values associated to a certain attribute e.g. the `UIColor` associated to the attribute `backgroundColor`.
public protocol Attributed: Collection, ExpressibleByArrayLiteral, BaseAttributed {
    
    /// `Attribute` type used to style. Needs conformancs to `AssociatedValueStrippable` and `AssociatedValueEnumExtractor` so that we can perform merging operations and also logic such as `contains:attribute` and `value` extraction, accessing the value associated to a certain attribute. e.g. the `UIColor` associated to the attribute `backgroundColor`
    associatedtype Attribute: AssociatedValueStrippable, AssociatedValueEnumExtractor
    
    init(_ attributes: [Attribute])
    
    /// Attributes used to style some `Styleable` type
    var attributes: [Attribute] { get }
    
    /// Needed for conformance to `Collection`
    var startIndex: Int { get }
    
    //MARK: - Merging methods
    func merge(slave: Self) -> Self
    func merge(master: Self) -> Self
    
    func merge(slave: [Attribute]) -> Self
    func merge(master: [Attribute]) -> Self
    
    func merge(slave: Attribute) -> Self
    func merge(master: Attribute) -> Self
}

