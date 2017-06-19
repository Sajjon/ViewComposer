//
//  Makeable+Mergeable.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-09.
//
//

import Foundation

//swiftlint:disable force_cast
public extension Attributed {
    
    func merge<M: Makeable>(slave: Self) -> M where M.Styled == M, M.Style == Self {
        return M.make(merge(slave: slave))
    }
    
    func merge<M: Makeable>(master: Self) -> M where M.Styled == M, M.Style == Self {
        return master.merge(slave: self)
    }
    
    func merge<M: Makeable>(slave: Attribute) -> M where M.Styled == M, M.Style == Self {
        return merge(slave: Self([slave]))
    }
    
    func merge<M: Makeable>(master: Attribute) -> M where M.Styled == M, M.Style == Self {
        return merge(master: Self([master]))
    }
}
