//
//  TextFieldAttribute+Attributes.swift
//  ViewComposer1
//
//  Created by Alexander Cyon on 2018-04-22.
//  Copyright © 2018 cyon. All rights reserved.
//

import UIKit

public extension TextFieldAttribute{
    public static func placeholder<A>(_ value: String?) -> A where A: TextFieldAttribute {
        return A(name: .placeholder, value: value as Any)
    }
}
