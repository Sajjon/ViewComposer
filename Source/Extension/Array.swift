//
//  Array.swift
//  ViewComposer1
//
//  Created by Alexander Cyon on 2018-04-23.
//  Copyright © 2018 cyon. All rights reserved.
//

import Foundation

public extension Array where Element: BaseAttributeProtocol {
    func asTuples() -> [(String, Any)] {
        return map { ($0.name, $0.anyValue) }
    }
}
