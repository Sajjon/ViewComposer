//
//  ViewAttribute.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-31.
//
//

import Foundation

extension ViewAttribute {}
public enum ViewAttribute {
    case custom(AnyAttributed)
    
    // View
    case isHidden(Bool)
    case backgroundColor(UIColor)
    case cornerRadius(CGFloat) /* might be overridden by: */; case radius(Radius)
    case verticalHugging(LayoutPriority)
    case verticalCompression(LayoutPriority)
    case horizontalHugging(LayoutPriority)
    case horizontalCompression(LayoutPriority)
    case contentMode(UIViewContentMode)
    case height(CGFloat)
    case width(CGFloat)
    
    // TextHolder
    case text(String)
    case font(UIFont)
    case textColor(UIColor)
    case `case`(Case)
    case textAlignment(NSTextAlignment)
    
    // ImageHolder
    case image(UIImage)
    
    // UIScrollView
    case isScrollEnabled(Bool)
    
    // ControlState
    case states([ControlState])
    
    // UIControl
    case target(Actor)
    
    // UIStackView
    case axis(UILayoutConstraintAxis)
    case distribution(UIStackViewDistribution)
    case alignment(UIStackViewAlignment)
    case spacing(CGFloat)
    case margin(CGFloat)
    case arrangedSubviews([UIView])
}

public extension Array where Element == ViewAttribute {
    func merge(slave: [ViewAttribute]) -> [ViewAttribute] {
        return ViewStyle(self).merge(slave: ViewStyle(slave)).attributes
    }
    
    func merge(master: [ViewAttribute]) -> [ViewAttribute] {
        return ViewStyle(self).merge(master: ViewStyle(master)).attributes
    }
}

