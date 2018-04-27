//
//  StackViewStyle.swift
//  ViewComposer1
//
//  Created by Alexander Cyon on 2018-04-25.
//  Copyright © 2018 cyon. All rights reserved.
//

import UIKit

public class StackViewStyle: ViewStyle<StackViewAttribute> {
    public convenience required init(arrayLiteral elements: StackViewAttribute...) {
        self.init(attributes: elements)
    }

    public override func install(on view: UIView) {
        super.install(on: view)
        guard let stackView = view as? UIStackView else { fatalError("not UIStackView") }
        for (name, value) in attributes {
            let v = value
            switch name {
            case .axis:
                if let v = v as? UILayoutConstraintAxis { stackView.axis = v }
            case .arrangedSubviews:
                if let v = v as? [UIView] { v.forEach { stackView.addArrangedSubview($0) } }
            case .distribution:
                if let v = v as? UIStackViewDistribution { stackView.distribution = v }
            default:
                print("⚠️ WARNING Not yet supporting attribute with name: `\(name)`, having value: `\(value)`")
                continue
            }
        }
    }
}
