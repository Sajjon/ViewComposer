//
//  TextViewStyle.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2018-04-25.
//  Copyright © 2018 cyon. All rights reserved.
//

import Foundation

open class ScrollViewStyle<AS: ScrollViewAttribute>: ViewStyle<AS> {
    public typealias Attribute = AS
    public typealias ArrayLiteralElement = AS
    public override func install(on view: UIView) {
        super.install(on: view)
        guard let scrollView = view as? UIScrollView else { fatalError("not UIScrollView") }
        for (name, value) in attributes {
            let v = value
            switch name {
            case .contentInsetAdjustmentBehavior:
                if let v = v as? UIScrollViewContentInsetAdjustmentBehavior { scrollView.contentInsetAdjustmentBehavior = v }
            default:
                print("⚠️ WARNING Not yet supporting attribute with name: `\(name)`, having value: `\(value)`")
                continue
            }
        }
    }
}

open class TextViewStyle: ScrollViewStyle<TextViewAttribute> {
    public typealias Attribute = TextViewAttribute
    public typealias ArrayLiteralElement = TextViewAttribute

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
