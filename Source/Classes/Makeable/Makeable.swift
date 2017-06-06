//
//  Makeable.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-06.
//
//

import Foundation

public protocol Makeable: EmptyInitializable, Styleable {
    static func make(_ attributes: [Style.Attribute]) -> Styled
    func postMake(_ style: Style)
}

extension Makeable {
    
    public func postMake(_ style: Style) {}
    
    
    public static func make(_ attributes: [Style.Attribute]) -> Styled {
        let style: Style = attributes.merge(slave: []) // do not allow duplicates
        return make(style)
    }
    
    public static func make(_ style: Style) -> Styled {
        let view: Styled = createEmpty()
        if let selfStylable = view as? Self {
            selfStylable.setup(with: style)
            selfStylable.postMake(style)
        }
        return view
    }
}

// Makes (pun intended) it possible to write `let label: UILabel = make([.text("hi")])` notice the lack of `.` in `.make`.
public func make<M: Makeable>(_ attributes: [M.Style.Attribute]) -> M where M.Styled == M {
    return M.make(attributes)
}

// Array literals support
public func make<M: Makeable>(_ attributes: M.Style.Attribute...) -> M where M.Styled == M {
    return make(attributes)
}
