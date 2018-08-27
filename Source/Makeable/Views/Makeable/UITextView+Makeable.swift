//
//  UITextView+Makeable.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2018-04-29.
//

import UIKit

extension UIScrollView: Composable {

    public typealias Style = ScrollViewStyle<ScrollViewAttribute>

//    public typealias Attribute = ScrollViewAttribute

//    public typealias ArrayLiteralElement = ScrollViewAttribute

    public typealias SelfMakeable = UIScrollView

}

extension UITextView: SubMakeable {
    public func asSuper() -> SuperKlassType {
        return self as UIScrollView
    }
    public typealias SuperKlassType = UIScrollView
    public typealias SelfMakeable = UITextView
    public typealias Style = TextViewStyle
    public typealias Attribute = TextViewAttribute

    public typealias ArrayLiteralElement = TextViewAttribute
}
