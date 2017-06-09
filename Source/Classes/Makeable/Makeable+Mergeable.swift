//
//  Makeable+Mergeable.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-09.
//
//

import Foundation

public extension Attributed {

    func merge<M: Makeable>(slave: Self) -> M where M.Style == Self {
        let style: M.Style = merge(slave: slave)
        return M.make(style) as! M
    }
    
    func merge<M: Makeable>(master: Self) -> M where M.Style == Self {
        return master.merge(slave: self)
    }

    func merge<M: Makeable>(slave: M.Style.Attribute) -> M where M.Style == Self {
        return merge(slave: Self([slave]))
    }
    
    func merge<M: Makeable>(master: M.Style.Attribute) -> M where M.Style == Self {
        return merge(master: Self([master]))
    }
}
