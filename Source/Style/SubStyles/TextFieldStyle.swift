//
//  TextFieldStyle.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2018-04-25.
//  Copyright © 2018 cyon. All rights reserved.
//

import UIKit

public class TextFieldStyle: ViewStyle<TextFieldAttribute> {
    public override func install(on view: UIView) {
        super.install(on: view)
        guard let label = view as? UITextField else { fatalError("not UITextField") }
        for (name, value) in attributes {
            let v = value
            switch name {
            case .placeholder:
                if let v = v as? String { label.placeholder = v }
            default:
                print("⚠️ WARNING Not yet supporting attribute with name: `\(name)`, having value: `\(value)`")
                continue
            }
        }
    }
}

extension TextFieldStyle: TextOwnerStyle {}
