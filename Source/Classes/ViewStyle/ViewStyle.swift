//
//  ViewStyle.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-30.
//
//

import UIKit

public struct ViewStyle: Attributed {
    public typealias Attribute = ViewAttribute
    public typealias Element = ViewAttribute

    public var startIndex: Int = 0
    
    public let attributes: [ViewAttribute]
    
    public init(_ attributes: [ViewAttribute]) {
        self.attributes = attributes
    }
    
    public init(arrayLiteral elements: ViewAttribute...) {
        self.attributes = elements
    }
}

public extension ViewStyle {
    func install(on styleable: Any) {
        guard let view = styleable as? UIView else { fatalError("not a view") }
        if let targetable = view as? Targetable {
            targetable.apply(self)
        }
        
        if let textHolder = view as? TextHolder {
            textHolder.apply(self)
        }
        
        if let fontSizeAdjusting = view as? FontSizeAdjusting {
            fontSizeAdjusting.apply(self)
        }
        
        if let textInputting = view as? TextInputting {
            textInputting.apply(self)
        }
        
        if let imageHolder = view as? ImageHolder {
            imageHolder.apply(self)
        }
        
        if let placeholder = view as? PlaceholderOwner {
            placeholder.apply(self)
        }
        
        if let stackView = view as? UIStackView {
            stackView.apply(self)
        }
        
        if let scrollView = view as? UIScrollView {
            scrollView.applyToSuperclass(self)
        }
        
        if let collectionView = view as? UICollectionView {
            collectionView.apply(self)
        }
        
        if let label = view as? UILabel {
            label.apply(self)
        }
        
        if let bar = view as? UISearchBar {
            bar.apply(self)
        }
        
        if let segmentedControl = view as? UISegmentedControl {
            segmentedControl.apply(self)
        }
        
        if let button = view as? UIButton {
            button.apply(self)
        }
        
        if let stateHolder = view as? ControlStateHolder {
            stateHolder.apply(self)
        }
        
        // Also handling case `dataSourceDelegate`
        if let delegateOwner = view as? DelegatesOwner {
            delegateOwner.apply(self)
        }
        
        // Also handling case `dataSourceDelegate`
        if let delegateOwner = view as? DataSourceOwner {
            delegateOwner.apply(self)
        }
        
        if let thumbTintColorOwner = view as? ThumbTintColorOwner {
            thumbTintColorOwner.apply(self)
        }
        
        if let slider = view as? UISlider {
            slider.apply(self)
        }
        
        if let `switch` = view as? UISwitch {
            `switch`.apply(self)
        }
        
        if let cellRegisterable = view as? CellRegisterable {
            cellRegisterable.apply(self)
        }
        
        // Shared
        attributes.forEach {
            switch $0 {
            // All UIViews
            case .custom(let attributed):
                attributed.install(on: styleable)
            case .hidden(let isHidden):
                view.isHidden = isHidden
            case .layoutMargins(let margin):
                view.layoutMargins = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
            case .backgroundColor(let color):
                view.backgroundColor = color
            case .verticalHugging(let prio):
                view.setContentHuggingPriority(prio.value, for: .vertical)
            case .verticalCompression(let prio):
                view.setContentCompressionResistancePriority(prio.value, for: .vertical)
            case .horizontalHugging(let prio):
                view.setContentHuggingPriority(prio.value, for: .horizontal)
            case .horizontalCompression(let prio):
                view.setContentCompressionResistancePriority(prio.value, for: .horizontal)
            case .contentMode(let contentMode):
                view.contentMode = contentMode
            case .userInteractable(let isUserInteractionEnabled):
                view.isUserInteractionEnabled = isUserInteractionEnabled
            case .tintColor(let tintColor):
                view.tintColor = tintColor
            case .clipsToBounds(let clipsToBounds):
                view.clipsToBounds = clipsToBounds
            case .alpha(let alpha):
                view.alpha = alpha
            case .opaque(let isOpaque):
                view.isOpaque = isOpaque
            case .exclusiveTouch(let isExclusiveTouch):
                view.isExclusiveTouch = isExclusiveTouch
            case .multipleTouchEnabled(let isMultipleTouchEnabled):
                view.isMultipleTouchEnabled = isMultipleTouchEnabled
            case .clearsContextBeforeDrawing(let clearsContextBeforeDrawing):
                view.clearsContextBeforeDrawing = clearsContextBeforeDrawing
            
                // Layer
            case .cornerRadius(let radius):
                view.layer.cornerRadius = radius
                view.layer.masksToBounds = radius > 0
            case .borderWidth(let borderWidth):
                view.layer.borderWidth = borderWidth
            case .borderColor(let borderColor):
                view.layer.borderColor = borderColor.cgColor
            default:
                break
            }
        }
    }
}

private extension DelegatesOwner {
    func apply(_ style: ViewStyle) {
        style.attributes.forEach {
            switch $0 {
            case .delegate(let delegate):
                setDelegate(delegate)
            case .dataSourceDelegate(let delegate):
                setDelegate(delegate)
            default:
                break
            }
        }
    }
}

private extension DataSourceOwner {
    func apply(_ style: ViewStyle) {
        style.attributes.forEach {
            switch $0 {
            case .dataSource(let dataSource):
                setDataSource(dataSource)
            case .dataSourceDelegate(let dataSource):
                setDataSource(dataSource)
            default:
                break
            }
        }
    }
}

private extension UITextField {
    func apply(_ style: ViewStyle) {
        style.attributes.forEach {
            switch $0 {
            case .clearButtonMode(let clearButtonMode):
                self.clearButtonMode = clearButtonMode
            case .borderStyle(let borderStyle):
                self.borderStyle = borderStyle
            default:
                break
            }
        }
    }
}

private extension UITextView {
    func apply(_ style: ViewStyle) {
        style.attributes.forEach {
            switch $0 {
            case .selectedRange(let range):
                self.selectedRange = range
            default:
                break
            }
        }
    }
}

private extension Targetable {
    func apply(_ style: ViewStyle) {
        style.attributes.forEach {
            switch $0 {
            case .target(let actor):
                addTarget(using: actor)
            case .enabled(let enabled):
                setEnabled(enabled)
            case .selected(let selected):
                setSelected(selected)
            case .highlighted(let highlighted):
                setHighlighted(highlighted)
            default:
                break
            }
        }
    }
}

private extension TextHolder {
    func apply(_ style: ViewStyle) {
        style.attributes.forEach {
            switch $0 {
            case .font(let font):
                setFont(font)
            case .textColor(let textColor):
                setTextColor(textColor)
            case .text(let text):
                setText(text)
            case .textAlignment(let textAlignment):
                setTextAlignment(textAlignment)
            case .case(let `case`):
                setCase(`case`)
            default:
                break
            }
        }
    }
}

private extension FontSizeAdjusting {
    func apply(_ style: ViewStyle) {
        style.attributes.forEach {
            switch $0 {
            case .adjustsFontSizeToFitWidth(let adjusts):
                setAdjustsFontSizeToFitWidth(adjusts)
            default:
                break
            }
        }
    }
}

private extension TextInputting {
    func apply(_ style: ViewStyle) {
        style.attributes.forEach {
            switch $0 {
            case .editable(let editable):
                setEditable(editable)
            case .clearsOnInsertion(let clearsOnInsertion):
                setClearsOnInsertion(clearsOnInsertion)
            case .clearsOnBeginEditing(let clearsOnBeginEditing):
                setClearsOnBeginEditing(clearsOnBeginEditing)
            default:
                break
            }
        }
    }
}

private extension ImageHolder {
    func apply(_ style: ViewStyle) {
        style.attributes.forEach {
            switch $0 {
            case .image(let image):
                setImage(image)
            default:
                break
            }
        }
    }
}

private extension PlaceholderOwner {
    func apply(_ style: ViewStyle) {
        style.attributes.forEach {
            switch $0 {
            case .placeholder(let placeholder):
                setPlaceholder(placeholder)
            default:
                break
            }
        }
    }
}

private extension UIStackView {
    func apply(_ style: ViewStyle) {
        style.attributes.forEach {
            switch $0 {
            case .alignment(let alignment):
                self.alignment = alignment
            case .axis(let axis):
                self.axis = axis
            case .spacing(let spacing):
                self.spacing = spacing
            case .distribution(let distribution):
                self.distribution = distribution
            case .baselineRelative(let isBaselineRelativeArrangement):
                self.isBaselineRelativeArrangement = isBaselineRelativeArrangement
            case .marginsRelative(let isLayoutMarginsRelativeArrangement):
                self.isLayoutMarginsRelativeArrangement = isLayoutMarginsRelativeArrangement
            default:
                break
            }
        }
    }
}

private extension UICollectionView {
    func apply(_ style: ViewStyle) {
        style.attributes.forEach {
            switch $0 {
            case .itemSize(let itemSize):
                guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else { break }
                flowLayout.itemSize = itemSize
            default:
                break
            }
        }
    }
}

private extension UIScrollView {
    func applyToSuperclass(_ style: ViewStyle) {
        style.attributes.forEach {
            switch $0 {
            case .scrollEnabled(let isScrollEnabled):
                self.isScrollEnabled = isScrollEnabled
            case .contentSize(let contentSize):
                self.contentSize = contentSize
            case .contentInset(let contentInset):
                self.contentInset = contentInset
            case .bounces(let bounces):
                self.bounces = bounces
            case .alwaysBounceVertical(let bounce):
                self.alwaysBounceVertical = bounce
            case .alwaysBounceHorizontal(let bounce):
                self.alwaysBounceHorizontal = bounce
            case .pagingEnabled(let enabled):
                self.isPagingEnabled = enabled
            case .showsHorizontalScrollIndicator(let show):
                self.showsHorizontalScrollIndicator = show
            case .showsVerticalScrollIndicator(let show):
                self.showsVerticalScrollIndicator = show
            case .indicatorStyle(let style):
                self.indicatorStyle = style
            case .decelerationRate(let rate):
                self.decelerationRate = rate
            case .delaysContentTouches(let delay):
                self.delaysContentTouches = delay
            case .canCancelContentTouches(let canCancel):
                self.canCancelContentTouches = canCancel
            case .minimumZoomScale(let zoomScale):
                self.minimumZoomScale = zoomScale
            case .maximumZoomScale(let zoomScale):
                self.maximumZoomScale = zoomScale
            case .bouncesZoom(let zoom):
                self.bouncesZoom = zoom
            case .scrollsToTop(let scrolls):
                self.scrollsToTop = scrolls
            case .keyboardDismissMode(let dismissMode):
                self.keyboardDismissMode = dismissMode
            default:
                break
            }
        }
    }
}

private extension UILabel {
    func apply(_ style: ViewStyle) {
        style.attributes.forEach {
            switch $0 {
            case .numberOfLines(let numberOfLines):
                self.numberOfLines = numberOfLines
            case .highlightedTextColor(let highlightedTextColor):
                self.highlightedTextColor = highlightedTextColor
            case .minimumScaleFactor(let minimumScaleFactor):
                self.minimumScaleFactor = minimumScaleFactor
            case .baselineAdjustment(let baselineAdjustment):
                self.baselineAdjustment = baselineAdjustment
            case .shadowColor(let shadowColor):
                self.shadowColor = shadowColor
            case .shadowOffset(let shadowOffset):
                self.shadowOffset = shadowOffset
            default:
                break
            }
        }
    }
}

private extension UISearchBar {
    func apply(_ style: ViewStyle) {
        style.attributes.forEach {
            switch $0 {
            case .prompt(let prompt):
                self.prompt = prompt
            case .searchBarStyle(let style):
                self.searchBarStyle = style
            default:
                break
            }
        }
    }
}

private extension UISegmentedControl {
    func apply(_ style: ViewStyle) {
        style.attributes.forEach {
            switch $0 {
            case .segments(let segments):
                segments.add(to: self)
            default:
                break
            }
        }
    }
}

private extension ThumbTintColorOwner {
    func apply(_ style: ViewStyle) {
        style.attributes.forEach {
            switch $0 {
            case .thumbTintColor(let color):
                setThumbTintColor(color)
            default:
                break
            }
        }
    }
}

private extension UISlider {
    func apply(_ style: ViewStyle) {
        style.attributes.forEach {
            switch $0 {
            case .sliderValue(let value):
                self.value = Float(value)
            case .sliderRange(let range):
                self.minimumValue = Float(range.lowerBound)
                self.maximumValue = Float(range.upperBound)
            default:
                break
            }
        }
    }
}

private extension UISwitch {
    func apply(_ style: ViewStyle) {
        style.attributes.forEach {
            switch $0 {
            case .on(let isOn):
                self.isOn = isOn
            case .onTintColor(let color):
                self.onTintColor = color
            case .onImage(let image):
                self.onImage = image
            case .offImge(let image):
                self.offImage = image
            default:
                break
            }
        }
    }
}

private extension CellRegisterable {
    func apply(_ style: ViewStyle) {
        style.attributes.forEach {
            switch $0 {
            case .registerCells(let cells):
                registerCells(cells)
            default:
                break
            }
        }
    }
}

private extension UIButton {
    func apply(_ style: ViewStyle) {
        style.attributes.forEach {
            switch $0 {
            case .contentEdgeInsets(let insets):
                self.contentEdgeInsets = insets
            case .titleEdgeInsets(let insets):
                self.titleEdgeInsets = insets
            case .reversesTitleShadowWhenHighlighted(let reverses):
                self.reversesTitleShadowWhenHighlighted = reverses
            case .imageEdgeInsets(let insets):
                self.imageEdgeInsets = insets
            case .adjustsImageWhenHighlighted(let adjusts):
                self.adjustsImageWhenHighlighted = adjusts
            case .adjustsImageWhenDisabled(let adjusts):
                self.adjustsImageWhenDisabled = adjusts
            case .showsTouchWhenHighlighted(let show):
                self.showsTouchWhenHighlighted = show
            default:
                break
            }
        }
    }
}

private extension ControlStateHolder {
    func apply(_ style: ViewStyle) {
        style.attributes.forEach {
            switch $0 {
            case .states(let states):
                setControlStates(states)
            default:
                break
            }
        }
    }
}
