//
//  ViewAttribute.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-31.
//
//

import Foundation

public enum ViewAttribute {
    case custom(BaseAttributed)
    
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
    
    // PlaceholderOwner
    case placeholder(String)
    
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
    case marginsRelative(Bool)
    case baselineRelative(Bool)
    case arrangedSubviews([UIView])
}

public extension Array where Element == ViewAttribute {
    func merge(master: [ViewAttribute]) -> ViewStyle {
        return ViewStyle(self).merge(master: master)
    }
    
    func merge(master: ViewAttribute) -> ViewStyle {
        return merge(master: [master])
    }
    
    func merge(slave: [ViewAttribute]) -> ViewStyle {
        return ViewStyle(self).merge(slave: slave)
    }
    
    func merge(slave: ViewAttribute) -> ViewStyle {
        return merge(slave: [slave])
    }
    
}

extension ViewAttribute {
    func merge(master: ViewStyle) -> ViewStyle {
        return self <<- master
    }
    
    func merge(master: [ViewAttribute]) -> ViewStyle {
        return self <<- master
    }
    
    func merge(master: ViewAttribute) -> ViewStyle {
        return self <<- master
    }

    func merge(slave: ViewStyle) -> ViewStyle {
        return self <- slave
    }
    
    func merge(slave: [ViewAttribute]) -> ViewStyle {
        return self <- slave
    }
    
    func merge(slave: ViewAttribute) -> ViewStyle {
        return self <- slave
    }
}

