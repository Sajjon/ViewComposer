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
    
    //MARK: - View
    case hidden(Bool)
    case backgroundColor(UIColor)
    case verticalHugging(LayoutPriority)
    case verticalCompression(LayoutPriority)
    case horizontalHugging(LayoutPriority)
    case horizontalCompression(LayoutPriority)
    case contentMode(UIViewContentMode)
    case height(CGFloat)
    case width(CGFloat)
    case layoutMargins(all: CGFloat)
    
    case userInteractable(Bool)
    case tintColor(UIColor)
    case clipsToBounds(Bool)
    case alpha(CGFloat)
    case opaque(Bool)
    case exclusiveTouch(Bool)
    case multipleTouchEnabled(Bool)
    case clearsContextBeforeDrawing(Bool)
    
    //MARK: - UIView: Layer
    case cornerRadius(CGFloat) /* might be overridden by: */; case radius(Radius)
    case borderWidth(CGFloat)
    case borderColor(UIColor)
    
    //MARK: - TextHolder
    case text(String)
    case font(UIFont)
    case textColor(UIColor)
    case `case`(Case)
    case textAlignment(NSTextAlignment)
    
    //MAKR: - FontSizeAdjusting (UILabel + UITextField)
    case adjustsFontSizeToFitWidth(Bool)
    
    //MARK: - PlaceholderOwner
    case placeholder(String)
    
    //MARK: - TextInputting (UITextField + UITextView)
    case editable(Bool)
    case clearsOnInsertion(Bool)
    case clearsOnBeginEditing(Bool)
    
    //MARK: - UILabel
    case numberOfLines(Int)
    case highlightedTextColor(UIColor)
    case minimumScaleFactor(CGFloat)
    case baselineAdjustment(UIBaselineAdjustment)
    case shadowColor(UIColor)
    case shadowOffset(CGSize)
    
    //MARK: - UITextField
    case clearButtonMode(UITextFieldViewMode)
    case borderStyle(UITextBorderStyle)
    
    //MARK: - UITextView
    case selectedRange(NSRange)
    
    //MARK: - ImageHolder
    case image(UIImage)
    
    //MARK: - UIScrollView
    case scrollEnabled(Bool)
    case contentSize(CGSize)
    case contentInset(UIEdgeInsets)
    case bounces(Bool)
    case alwaysBounceVertical(Bool)
    case alwaysBounceHorizontal(Bool)
    case pagingEnabled(Bool)
    case showsHorizontalScrollIndicator(Bool)
    case showsVerticalScrollIndicator(Bool)
    case scrollIndicatorInsets(UIEdgeInsets)
    case indicatorStyle(UIScrollViewIndicatorStyle)
    case decelerationRate(CGFloat)
    case delaysContentTouches(Bool)
    case canCancelContentTouches(Bool)
    case minimumZoomScale(CGFloat)
    case maximumZoomScale(CGFloat)
    case zoomScale(CGFloat)
    case bouncesZoom(Bool)
    case scrollsToTop(Bool)
    case keyboardDismissMode(UIScrollViewKeyboardDismissMode)
    
    //MARK: - ControlState
    case states([ControlState])

    //MARK: - Targetable
    case target(Actor)
    case enabled(Bool)
    case selected(Bool)
    case highlighted(Bool)
    
    //MARK: - UIButton
    case contentEdgeInsets(UIEdgeInsets)
    case titleEdgeInsets(UIEdgeInsets)
    case reversesTitleShadowWhenHighlighted(Bool)
    case imageEdgeInsets(UIEdgeInsets)
    case adjustsImageWhenHighlighted(Bool)
    case adjustsImageWhenDisabled(Bool)
    case showsTouchWhenHighlighted(Bool)
    
    //MARK: - UIStackView
    case axis(UILayoutConstraintAxis)
    case distribution(UIStackViewDistribution)
    case alignment(UIStackViewAlignment)
    case spacing(CGFloat)
    case margin(CGFloat)
    case marginsRelative(Bool)
    case baselineRelative(Bool)
    case arrangedSubviews([UIView])
}
