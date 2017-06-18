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
    func merge<M: Makeable>(slave: M.Style) -> M where M.Styled == M {
        let selfStyle: M.Style = self as! M.Style
        let merged: M.Style = selfStyle.merge(slave: slave)
        return M.make(merged)
    }
    
    func merge<M: Makeable>(master: M.Style) -> M where M.Styled == M {
        let selfStyle: M.Style = self as! M.Style
        return master.merge(slave: selfStyle)
    }
    
    func merge<M: Makeable>(slave: M.Style.Attribute) -> M where M.Styled == M {
        return merge(slave: M.Style([slave]))
    }
    
    func merge<M: Makeable>(master: M.Style.Attribute) -> M where M.Styled == M {
        return merge(master: M.Style([master]))
    }
}
