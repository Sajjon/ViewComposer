//
//  ViewAttribute.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-31.
//
//

import Foundation

public struct SomeStripped: StrippedRepresentation {
    public typealias RawValue = String
    public init(rawValue: String) { fatalError() }
    public var rawValue: String { return "foo" }
}

extension SomeStripped: Equatable {
    public static func == (lhs: SomeStripped, rhs: SomeStripped) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}

extension SomeStripped: Hashable {
    public var hashValue: Int {
        return rawValue.hashValue
    }
}

public enum ViewAttribute {
//    case customAttributed(AnyAttributed<Attribute>)// this would force `ViewAttribute` to be generic which creates a lot o problems
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
    func merge(slave: [ViewAttribute]) -> [ViewAttribute] {
        return ViewStyle(self).merge(slave: ViewStyle(slave)).attributes
    }
    
    func merge(master: [ViewAttribute]) -> [ViewAttribute] {
        return ViewStyle(self).merge(master: ViewStyle(master)).attributes
    }
}

