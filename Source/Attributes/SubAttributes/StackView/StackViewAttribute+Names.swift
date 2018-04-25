//
//  StackViewAttribute+Names.swift
//  ViewComposer1
//
//  Created by Alexander Cyon on 2018-04-25.
//  Copyright © 2018 cyon. All rights reserved.
//

import Foundation

//public class StackViewAttributeName: ViewAttributeName {}
//
//public extension StackViewAttributeName {
//
//    fileprivate typealias N = StackViewAttributeName
//
//    static var axis: StackViewAttributeName {
//        return N(#function)
//    }
//}

extension String {
    static var arrangedSubviews: String {
        return #function
    }

    static var axis: String {
        return #function
    }

    static var distribution: String {
        return #function
    }
}
