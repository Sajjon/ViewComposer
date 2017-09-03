//
//  ViewAttribute.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-31.
//
//

import Foundation

//swiftlint:disable:next type_body_length
public enum ViewAttribute {
    case custom(BaseAttributed)
    case delegate(NSObjectProtocol?)
    case dataSource(NSObjectProtocol?)
    case dataSourceDelegate(NSObjectProtocol?)
    
    //MARK: - View
    case hidden(Bool)
    case color(UIColor)
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
    case semanticContentAttribute(UISemanticContentAttribute)
    
    //MARK: - UIView: Layer
    case cornerRadius(CGFloat) /* might be overridden by: */; case roundedBy(CornerRounding)
    case borderWidth(CGFloat)
    case borderColor(UIColor)
    
    //MARK: - TextHolder
    case text(String?)
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
    case inputView(UIView?)
    case inputAccessoryView(UIView?)
    case allowsEditingTextAttributes(Bool)
    case dataDetectorTypes(UIDataDetectorTypes)
    case typingAttributes([String: Any]?)
    
    //MARK: - UILabel
    case numberOfLines(Int)
    case highlightedTextColor(UIColor)
    case minimumScaleFactor(CGFloat)
    case baselineAdjustment(UIBaselineAdjustment)
    case shadowColor(UIColor)
    case shadowOffset(CGSize)
    case attributedText(NSAttributedString)
    
    //MARK: UITextInputTraits (UITextField & UISearchBar & UITextView)
    case autocapitalizationType(UITextAutocapitalizationType)
    case autocorrectionType(UITextAutocorrectionType)
    case spellCheckingType(UITextSpellCheckingType)
    case keyboardType(UIKeyboardType)
    case keyboardAppearance(UIKeyboardAppearance)
    case returnKeyType(UIReturnKeyType)
    case enablesReturnKeyAutomatically(Bool)
    case isSecureTextEntry(Bool)
    case textContentType(UITextContentType)
    
    //MARK: UITextField
    case borderStyle(UITextBorderStyle)
    case background(UIImage?)
    case disabledBackground(UIImage?)
    case clearButtonMode(UITextFieldViewMode)
    case leftView(UIView?)
    case leftViewMode(UITextFieldViewMode)
    case rightView(UIView?)
    case rightViewMode(UITextFieldViewMode)
    
    //MARK: - UITextView
    case selectedRange(NSRange)
    case linkTextAttributes([String: Any]?)
    case textContainerInset(UIEdgeInsets)
    
    //MARK: - ImageHolder
    case image(UIImage?)
    
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
    
    //MARK: - UIControl
    case states([ControlStateStyle])
    case contentVerticalAlignment(UIControlContentVerticalAlignment)
    case contentHorizontalAlignment(UIControlContentHorizontalAlignment)
    case targets([Actor])
    public static func target(_ actor: Actor) -> ViewAttribute {
        return .targets([actor])
    }
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
    case views([UIView?])
    
    //MARK: - CellRegisterable
    case registerCells([RegisterableCell])
    
    //MARK: CollectionTableView
    case backgroundView(UIView?)
    case allowsMultipleSelection(Bool)
    case allowsSelection(Bool)
    case remembersLastFocusedIndexPath(Bool)
    case prefetchDataSource(NSObjectProtocol?)
    
    //MARK: - UITableView
    case sectionIndexMinimumDisplayRowCount(Int)
    case sectionIndexTrackingBackgroundColor(UIColor?)
    case sectionIndexBackgroundColor(UIColor)
    case sectionIndexColor(UIColor)
    case rowHeight(CGFloat)
    case separatorStyle(UITableViewCellSeparatorStyle)
    case separatorColor(UIColor?)
    case separatorEffect(UIVisualEffect?)
    case separatorInset(UIEdgeInsets)
    case cellLayoutMarginsFollowReadableWidth(Bool)
    case sectionHeaderHeight(CGFloat)
    case sectionFooterHeight(CGFloat)
    case estimatedRowHeight(CGFloat)
    case estimatedSectionHeaderHeight(CGFloat)
    case estimatedSectionFooterHeight(CGFloat)
    case allowsSelectionDuringEditing(Bool)
    case allowsMultipleSelectionDuringEditing(Bool)
    case isEditing(Bool)
    
    //MARK: - UICollectionView
    case collectionViewLayout(UICollectionViewLayout)
    case itemSize(CGSize)
    case isPrefetchingEnabled(Bool)
    
    //MARK: - UISearchBar
    case prompt(String)
    case searchBarStyle(UISearchBarStyle)
    
    //MARK: - UISegmentedControl
    case segments([Segment])
    
    //MARK: ThumbTintColorOwner (UISwitch and UISlider)
    case thumbTintColor(UIColor?)
    
    //MARK: - UISwitch
    case on(Bool)
    case onTintColor(UIColor?)
    case onImage(UIImage?)
    case offImge(UIImage?)
    
    //MARK: WebView
    case webPage(URLRequest)

    //MARK: - UISlider
    case sliderValue(Double)
    case sliderRange(Range<Double>)
    
    //MARK: - UIActivityIndicatorView
    case spin(Bool)
    case hidesWhenStopped(Bool)
    case spinnerStyle(UIActivityIndicatorViewStyle)
    case spinnerScale(CGFloat)
    
    //MARK: - UIProgressView
    case progressViewStyle(UIProgressViewStyle)
    case progress(Float)
    case progressTintColor(UIColor?)
    case progressImage(UIImage?)
    case trackTintColor(UIColor?)
    case trackImage(UIImage?)
    
    //MARK: - UIPageControl
    case currentPage(Int)
    case numberOfPages(Int)
    case hidesForSinglePage(Bool)
    case pageIndicatorTintColor(UIColor)
    case currentPageIndicatorTintColor(UIColor)
}
