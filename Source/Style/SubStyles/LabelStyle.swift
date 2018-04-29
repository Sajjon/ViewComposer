//
//  LabelStyle.swift
//  ViewComposer1
//
//  Created by Alexander Cyon on 2018-04-22.
//  Copyright © 2018 cyon. All rights reserved.
//

import UIKit

public class LabelStyle: ViewStyle<LabelAttribute> {
    public convenience required init(arrayLiteral elements: LabelAttribute...) {
        self.init(attributes: elements)
    }

    public override func install(on view: UIView) {
        super.install(on: view)
        guard let label = view as? UILabel else { fatalError("not UILabel") }
        for (name, value) in attributes {
            let v = value
            switch name {
            case .numberOfLines:
                if let v = v as? Int { label.numberOfLines = v }
            default:
                print("⚠️ WARNING Not yet supporting attribute with name: `\(name)`, having value: `\(value)`")
                continue
            }
        }
    }
}

extension LabelStyle: TextOwnerStyle {}
