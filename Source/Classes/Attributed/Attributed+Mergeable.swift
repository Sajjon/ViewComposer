//
//  Attributed+Mergeable.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-06.
//
//

import Foundation

public extension Attributed {
    
    func merge(slave: Self) -> Self {
        let unionSet = Set(stripped).union(Set(slave.stripped))
        let unionAttributes = (attributes + slave.attributes).filter(stripped: Array(unionSet))
        return Self(unionAttributes)
    }
    
    func merge(slave: [Attribute]) -> Self {
        return merge(slave: Self(slave))
    }
    
    func merge(master: [Attribute]) -> Self {
        return Self(master).merge(slave: self)
    }
    
    func merge(slave: Attribute) -> Self {
        return merge(slave: Self([slave]))
    }
    
    func merge(master: Self) -> Self {
        return master.merge(slave: self)
    }
    
    func merge(master: Attribute) -> Self {
        return Self([master]).merge(slave: self)
    }
}
