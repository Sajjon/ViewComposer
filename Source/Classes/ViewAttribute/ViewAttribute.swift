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

public extension Attributed where Attribute == ViewAttribute {
    func merge(slave: Self) -> Self {
        
        if let custom: AnyAttributed<ViewAttribute> = self.value(.custom) {
//            if let customAttributed = custom as? AnyAttributed<AnyStrippable<ViewAttributeStripped>> {
//                print("custom is attributed: '\(customAttributed)'")
//            } else {
                print("found custom: `\(custom)`")
//            }
        }

        let unionSet = Set(stripped).union(Set(slave.stripped))
        let unionAttributes = (attributes + slave.attributes).filter(stripped: Array(unionSet))
        return Self(unionAttributes)
    }
}

//func cyon(_ sajjon: AnyAttributed) {
//    print("such fail")
//}
//
//func cyon(_ sajjon: Attributed) {
//    print("epic win")
//}


public extension Array where Element == ViewAttribute {
    func merge(slave: [ViewAttribute]) -> [ViewAttribute] {
        return ViewStyle(self).merge(slave: ViewStyle(slave)).attributes
    }
    
    func merge(master: [ViewAttribute]) -> [ViewAttribute] {
        return ViewStyle(self).merge(master: ViewStyle(master)).attributes
    }
}

