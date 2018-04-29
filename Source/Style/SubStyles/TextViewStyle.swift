//
//  TextViewStyle.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2018-04-29.
//

import Foundation

public class TextViewStyle: ViewStyle<TextViewAttribute> {
    public convenience required init(arrayLiteral elements: TextViewAttribute...) {
        self.init(attributes: elements)
    }

    public override func install(on view: UIView) {
        super.install(on: view)
        guard let textView = view as? UITextView else { fatalError("not UITextView") }
        for (name, value) in attributes {
            let v = value
            switch name {
            case .isEditable:
                if let v = v as? Bool { textView.isEditable = v }
            case .isSelectable:
                if let v = v as? Bool { textView.isSelectable = v }
            default:
                print("⚠️ WARNING Not yet supporting attribute with name: `\(name)`, having value: `\(value)`")
                continue
            }
        }
    }
}

extension TextViewStyle: TextOwnerStyle {}
