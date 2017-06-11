// Generated using Sourcery 0.6.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

public protocol AssociatedValueEnumExtractor {
    var associatedValue: Any? { get }
}

public extension AssociatedValueEnumExtractor {
    func associatedValueTyped<T>() -> T? {
        if let value = associatedValue as? T {
            return value
        } else if let recursive = associatedValue as? AssociatedValueEnumExtractor, let value = recursive.associatedValue as? T {
            return value
        } 
        return nil
    }
}

public protocol StrippedRepresentation: RawRepresentable, Equatable, Hashable {}
public protocol AssociatedValueStrippable: Equatable {
    associatedtype Stripped: StrippedRepresentation
    var stripped: Stripped { get }
}

        extension LayoutPriority: AssociatedValueEnumExtractor {
            public var associatedValue: Any? {
                switch self {
                            case .required: return nil
                            case .low: return nil
                            case .high: return nil
                                case .custom(let custom):
                                    return custom
                }
            }

                    var custom: Float? {
                        switch self {
                            case .custom(let custom):
                                return custom
                            default:
                                return nil
                        }
                    }
        }

        public enum LayoutPriorityStripped: String, StrippedRepresentation {
            case required
            case low
            case high
            case custom
        } 

        extension LayoutPriorityStripped {
            public var hashValue: Int {
                return rawValue.hashValue
            }

        }

        extension LayoutPriority: Hashable {
            public var hashValue: Int {
                return stripped.hashValue
            }
        }
        extension LayoutPriority: AssociatedValueStrippable {
        	public static func == (lhs: LayoutPriority, rhs: LayoutPriority) -> Bool {
        	    return lhs.stripped == rhs.stripped
        	}
            public typealias Stripped = LayoutPriorityStripped
            public var stripped: Stripped {
        		switch self {
        			 case .required:
        				return .required
        			 case .low:
        				return .low
        			 case .high:
        				return .high
        			 case .custom:
        				return .custom
        		}
        	}
        }

        extension ViewAttribute: AssociatedValueEnumExtractor {
            public var associatedValue: Any? {
                switch self {
                                case .custom(let custom):
                                    return custom
                                case .delegate(let delegate):
                                    return delegate
                                case .dataSource(let dataSource):
                                    return dataSource
                                case .dataSourceDelegate(let dataSourceDelegate):
                                    return dataSourceDelegate
                                case .hidden(let hidden):
                                    return hidden
                                case .backgroundColor(let backgroundColor):
                                    return backgroundColor
                                case .verticalHugging(let verticalHugging):
                                    return verticalHugging
                                case .verticalCompression(let verticalCompression):
                                    return verticalCompression
                                case .horizontalHugging(let horizontalHugging):
                                    return horizontalHugging
                                case .horizontalCompression(let horizontalCompression):
                                    return horizontalCompression
                                case .contentMode(let contentMode):
                                    return contentMode
                                case .height(let height):
                                    return height
                                case .width(let width):
                                    return width
                                case .layoutMargins(let layoutMargins):
                                    return layoutMargins
                                case .userInteractable(let userInteractable):
                                    return userInteractable
                                case .tintColor(let tintColor):
                                    return tintColor
                                case .clipsToBounds(let clipsToBounds):
                                    return clipsToBounds
                                case .alpha(let alpha):
                                    return alpha
                                case .opaque(let opaque):
                                    return opaque
                                case .exclusiveTouch(let exclusiveTouch):
                                    return exclusiveTouch
                                case .multipleTouchEnabled(let multipleTouchEnabled):
                                    return multipleTouchEnabled
                                case .clearsContextBeforeDrawing(let clearsContextBeforeDrawing):
                                    return clearsContextBeforeDrawing
                                case .cornerRadius(let cornerRadius):
                                    return cornerRadius
                                case .radius(let radius):
                                    return radius
                                case .borderWidth(let borderWidth):
                                    return borderWidth
                                case .borderColor(let borderColor):
                                    return borderColor
                                case .text(let text):
                                    return text
                                case .font(let font):
                                    return font
                                case .textColor(let textColor):
                                    return textColor
                                case .`case`(let `case`):
                                    return `case`
                                case .textAlignment(let textAlignment):
                                    return textAlignment
                                case .adjustsFontSizeToFitWidth(let adjustsFontSizeToFitWidth):
                                    return adjustsFontSizeToFitWidth
                                case .placeholder(let placeholder):
                                    return placeholder
                                case .editable(let editable):
                                    return editable
                                case .clearsOnInsertion(let clearsOnInsertion):
                                    return clearsOnInsertion
                                case .clearsOnBeginEditing(let clearsOnBeginEditing):
                                    return clearsOnBeginEditing
                                case .numberOfLines(let numberOfLines):
                                    return numberOfLines
                                case .highlightedTextColor(let highlightedTextColor):
                                    return highlightedTextColor
                                case .minimumScaleFactor(let minimumScaleFactor):
                                    return minimumScaleFactor
                                case .baselineAdjustment(let baselineAdjustment):
                                    return baselineAdjustment
                                case .shadowColor(let shadowColor):
                                    return shadowColor
                                case .shadowOffset(let shadowOffset):
                                    return shadowOffset
                                case .clearButtonMode(let clearButtonMode):
                                    return clearButtonMode
                                case .borderStyle(let borderStyle):
                                    return borderStyle
                                case .selectedRange(let selectedRange):
                                    return selectedRange
                                case .image(let image):
                                    return image
                                case .scrollEnabled(let scrollEnabled):
                                    return scrollEnabled
                                case .contentSize(let contentSize):
                                    return contentSize
                                case .contentInset(let contentInset):
                                    return contentInset
                                case .bounces(let bounces):
                                    return bounces
                                case .alwaysBounceVertical(let alwaysBounceVertical):
                                    return alwaysBounceVertical
                                case .alwaysBounceHorizontal(let alwaysBounceHorizontal):
                                    return alwaysBounceHorizontal
                                case .pagingEnabled(let pagingEnabled):
                                    return pagingEnabled
                                case .showsHorizontalScrollIndicator(let showsHorizontalScrollIndicator):
                                    return showsHorizontalScrollIndicator
                                case .showsVerticalScrollIndicator(let showsVerticalScrollIndicator):
                                    return showsVerticalScrollIndicator
                                case .scrollIndicatorInsets(let scrollIndicatorInsets):
                                    return scrollIndicatorInsets
                                case .indicatorStyle(let indicatorStyle):
                                    return indicatorStyle
                                case .decelerationRate(let decelerationRate):
                                    return decelerationRate
                                case .delaysContentTouches(let delaysContentTouches):
                                    return delaysContentTouches
                                case .canCancelContentTouches(let canCancelContentTouches):
                                    return canCancelContentTouches
                                case .minimumZoomScale(let minimumZoomScale):
                                    return minimumZoomScale
                                case .maximumZoomScale(let maximumZoomScale):
                                    return maximumZoomScale
                                case .zoomScale(let zoomScale):
                                    return zoomScale
                                case .bouncesZoom(let bouncesZoom):
                                    return bouncesZoom
                                case .scrollsToTop(let scrollsToTop):
                                    return scrollsToTop
                                case .keyboardDismissMode(let keyboardDismissMode):
                                    return keyboardDismissMode
                                case .states(let states):
                                    return states
                                case .target(let target):
                                    return target
                                case .enabled(let enabled):
                                    return enabled
                                case .selected(let selected):
                                    return selected
                                case .highlighted(let highlighted):
                                    return highlighted
                                case .contentEdgeInsets(let contentEdgeInsets):
                                    return contentEdgeInsets
                                case .titleEdgeInsets(let titleEdgeInsets):
                                    return titleEdgeInsets
                                case .reversesTitleShadowWhenHighlighted(let reversesTitleShadowWhenHighlighted):
                                    return reversesTitleShadowWhenHighlighted
                                case .imageEdgeInsets(let imageEdgeInsets):
                                    return imageEdgeInsets
                                case .adjustsImageWhenHighlighted(let adjustsImageWhenHighlighted):
                                    return adjustsImageWhenHighlighted
                                case .adjustsImageWhenDisabled(let adjustsImageWhenDisabled):
                                    return adjustsImageWhenDisabled
                                case .showsTouchWhenHighlighted(let showsTouchWhenHighlighted):
                                    return showsTouchWhenHighlighted
                                case .axis(let axis):
                                    return axis
                                case .distribution(let distribution):
                                    return distribution
                                case .alignment(let alignment):
                                    return alignment
                                case .spacing(let spacing):
                                    return spacing
                                case .margin(let margin):
                                    return margin
                                case .marginsRelative(let marginsRelative):
                                    return marginsRelative
                                case .baselineRelative(let baselineRelative):
                                    return baselineRelative
                                case .arrangedSubviews(let arrangedSubviews):
                                    return arrangedSubviews
                                case .registerCells(let registerCells):
                                    return registerCells
                                case .collectionViewLayout(let collectionViewLayout):
                                    return collectionViewLayout
                                case .itemSize(let itemSize):
                                    return itemSize
                                case .prompt(let prompt):
                                    return prompt
                                case .searchBarStyle(let searchBarStyle):
                                    return searchBarStyle
                                case .segments(let segments):
                                    return segments
                                case .thumbTintColor(let thumbTintColor):
                                    return thumbTintColor
                                case .on(let on):
                                    return on
                                case .onTintColor(let onTintColor):
                                    return onTintColor
                                case .onImage(let onImage):
                                    return onImage
                                case .offImge(let offImge):
                                    return offImge
                                case .sliderValue(let sliderValue):
                                    return sliderValue
                                case .sliderRange(let sliderRange):
                                    return sliderRange
                }
            }

                    var custom: BaseAttributed? {
                        switch self {
                            case .custom(let custom):
                                return custom
                            default:
                                return nil
                        }
                    }
                    var delegate: NSObjectProtocol? {
                        switch self {
                            case .delegate(let delegate):
                                return delegate
                            default:
                                return nil
                        }
                    }
                    var dataSource: NSObjectProtocol? {
                        switch self {
                            case .dataSource(let dataSource):
                                return dataSource
                            default:
                                return nil
                        }
                    }
                    var dataSourceDelegate: NSObjectProtocol? {
                        switch self {
                            case .dataSourceDelegate(let dataSourceDelegate):
                                return dataSourceDelegate
                            default:
                                return nil
                        }
                    }
                    var hidden: Bool? {
                        switch self {
                            case .hidden(let hidden):
                                return hidden
                            default:
                                return nil
                        }
                    }
                    var backgroundColor: UIColor? {
                        switch self {
                            case .backgroundColor(let backgroundColor):
                                return backgroundColor
                            default:
                                return nil
                        }
                    }
                    var verticalHugging: LayoutPriority? {
                        switch self {
                            case .verticalHugging(let verticalHugging):
                                return verticalHugging
                            default:
                                return nil
                        }
                    }
                    var verticalCompression: LayoutPriority? {
                        switch self {
                            case .verticalCompression(let verticalCompression):
                                return verticalCompression
                            default:
                                return nil
                        }
                    }
                    var horizontalHugging: LayoutPriority? {
                        switch self {
                            case .horizontalHugging(let horizontalHugging):
                                return horizontalHugging
                            default:
                                return nil
                        }
                    }
                    var horizontalCompression: LayoutPriority? {
                        switch self {
                            case .horizontalCompression(let horizontalCompression):
                                return horizontalCompression
                            default:
                                return nil
                        }
                    }
                    var contentMode: UIViewContentMode? {
                        switch self {
                            case .contentMode(let contentMode):
                                return contentMode
                            default:
                                return nil
                        }
                    }
                    var height: CGFloat? {
                        switch self {
                            case .height(let height):
                                return height
                            default:
                                return nil
                        }
                    }
                    var width: CGFloat? {
                        switch self {
                            case .width(let width):
                                return width
                            default:
                                return nil
                        }
                    }
                    var layoutMargins: CGFloat? {
                        switch self {
                            case .layoutMargins(let layoutMargins):
                                return layoutMargins
                            default:
                                return nil
                        }
                    }
                    var userInteractable: Bool? {
                        switch self {
                            case .userInteractable(let userInteractable):
                                return userInteractable
                            default:
                                return nil
                        }
                    }
                    var tintColor: UIColor? {
                        switch self {
                            case .tintColor(let tintColor):
                                return tintColor
                            default:
                                return nil
                        }
                    }
                    var clipsToBounds: Bool? {
                        switch self {
                            case .clipsToBounds(let clipsToBounds):
                                return clipsToBounds
                            default:
                                return nil
                        }
                    }
                    var alpha: CGFloat? {
                        switch self {
                            case .alpha(let alpha):
                                return alpha
                            default:
                                return nil
                        }
                    }
                    var opaque: Bool? {
                        switch self {
                            case .opaque(let opaque):
                                return opaque
                            default:
                                return nil
                        }
                    }
                    var exclusiveTouch: Bool? {
                        switch self {
                            case .exclusiveTouch(let exclusiveTouch):
                                return exclusiveTouch
                            default:
                                return nil
                        }
                    }
                    var multipleTouchEnabled: Bool? {
                        switch self {
                            case .multipleTouchEnabled(let multipleTouchEnabled):
                                return multipleTouchEnabled
                            default:
                                return nil
                        }
                    }
                    var clearsContextBeforeDrawing: Bool? {
                        switch self {
                            case .clearsContextBeforeDrawing(let clearsContextBeforeDrawing):
                                return clearsContextBeforeDrawing
                            default:
                                return nil
                        }
                    }
                    var cornerRadius: CGFloat? {
                        switch self {
                            case .cornerRadius(let cornerRadius):
                                return cornerRadius
                            default:
                                return nil
                        }
                    }
                    var radius: Radius? {
                        switch self {
                            case .radius(let radius):
                                return radius
                            default:
                                return nil
                        }
                    }
                    var borderWidth: CGFloat? {
                        switch self {
                            case .borderWidth(let borderWidth):
                                return borderWidth
                            default:
                                return nil
                        }
                    }
                    var borderColor: UIColor? {
                        switch self {
                            case .borderColor(let borderColor):
                                return borderColor
                            default:
                                return nil
                        }
                    }
                    var text: String? {
                        switch self {
                            case .text(let text):
                                return text
                            default:
                                return nil
                        }
                    }
                    var font: UIFont? {
                        switch self {
                            case .font(let font):
                                return font
                            default:
                                return nil
                        }
                    }
                    var textColor: UIColor? {
                        switch self {
                            case .textColor(let textColor):
                                return textColor
                            default:
                                return nil
                        }
                    }
                    var `case`: Case? {
                        switch self {
                            case .`case`(let `case`):
                                return `case`
                            default:
                                return nil
                        }
                    }
                    var textAlignment: NSTextAlignment? {
                        switch self {
                            case .textAlignment(let textAlignment):
                                return textAlignment
                            default:
                                return nil
                        }
                    }
                    var adjustsFontSizeToFitWidth: Bool? {
                        switch self {
                            case .adjustsFontSizeToFitWidth(let adjustsFontSizeToFitWidth):
                                return adjustsFontSizeToFitWidth
                            default:
                                return nil
                        }
                    }
                    var placeholder: String? {
                        switch self {
                            case .placeholder(let placeholder):
                                return placeholder
                            default:
                                return nil
                        }
                    }
                    var editable: Bool? {
                        switch self {
                            case .editable(let editable):
                                return editable
                            default:
                                return nil
                        }
                    }
                    var clearsOnInsertion: Bool? {
                        switch self {
                            case .clearsOnInsertion(let clearsOnInsertion):
                                return clearsOnInsertion
                            default:
                                return nil
                        }
                    }
                    var clearsOnBeginEditing: Bool? {
                        switch self {
                            case .clearsOnBeginEditing(let clearsOnBeginEditing):
                                return clearsOnBeginEditing
                            default:
                                return nil
                        }
                    }
                    var numberOfLines: Int? {
                        switch self {
                            case .numberOfLines(let numberOfLines):
                                return numberOfLines
                            default:
                                return nil
                        }
                    }
                    var highlightedTextColor: UIColor? {
                        switch self {
                            case .highlightedTextColor(let highlightedTextColor):
                                return highlightedTextColor
                            default:
                                return nil
                        }
                    }
                    var minimumScaleFactor: CGFloat? {
                        switch self {
                            case .minimumScaleFactor(let minimumScaleFactor):
                                return minimumScaleFactor
                            default:
                                return nil
                        }
                    }
                    var baselineAdjustment: UIBaselineAdjustment? {
                        switch self {
                            case .baselineAdjustment(let baselineAdjustment):
                                return baselineAdjustment
                            default:
                                return nil
                        }
                    }
                    var shadowColor: UIColor? {
                        switch self {
                            case .shadowColor(let shadowColor):
                                return shadowColor
                            default:
                                return nil
                        }
                    }
                    var shadowOffset: CGSize? {
                        switch self {
                            case .shadowOffset(let shadowOffset):
                                return shadowOffset
                            default:
                                return nil
                        }
                    }
                    var clearButtonMode: UITextFieldViewMode? {
                        switch self {
                            case .clearButtonMode(let clearButtonMode):
                                return clearButtonMode
                            default:
                                return nil
                        }
                    }
                    var borderStyle: UITextBorderStyle? {
                        switch self {
                            case .borderStyle(let borderStyle):
                                return borderStyle
                            default:
                                return nil
                        }
                    }
                    var selectedRange: NSRange? {
                        switch self {
                            case .selectedRange(let selectedRange):
                                return selectedRange
                            default:
                                return nil
                        }
                    }
                    var image: UIImage? {
                        switch self {
                            case .image(let image):
                                return image
                            default:
                                return nil
                        }
                    }
                    var scrollEnabled: Bool? {
                        switch self {
                            case .scrollEnabled(let scrollEnabled):
                                return scrollEnabled
                            default:
                                return nil
                        }
                    }
                    var contentSize: CGSize? {
                        switch self {
                            case .contentSize(let contentSize):
                                return contentSize
                            default:
                                return nil
                        }
                    }
                    var contentInset: UIEdgeInsets? {
                        switch self {
                            case .contentInset(let contentInset):
                                return contentInset
                            default:
                                return nil
                        }
                    }
                    var bounces: Bool? {
                        switch self {
                            case .bounces(let bounces):
                                return bounces
                            default:
                                return nil
                        }
                    }
                    var alwaysBounceVertical: Bool? {
                        switch self {
                            case .alwaysBounceVertical(let alwaysBounceVertical):
                                return alwaysBounceVertical
                            default:
                                return nil
                        }
                    }
                    var alwaysBounceHorizontal: Bool? {
                        switch self {
                            case .alwaysBounceHorizontal(let alwaysBounceHorizontal):
                                return alwaysBounceHorizontal
                            default:
                                return nil
                        }
                    }
                    var pagingEnabled: Bool? {
                        switch self {
                            case .pagingEnabled(let pagingEnabled):
                                return pagingEnabled
                            default:
                                return nil
                        }
                    }
                    var showsHorizontalScrollIndicator: Bool? {
                        switch self {
                            case .showsHorizontalScrollIndicator(let showsHorizontalScrollIndicator):
                                return showsHorizontalScrollIndicator
                            default:
                                return nil
                        }
                    }
                    var showsVerticalScrollIndicator: Bool? {
                        switch self {
                            case .showsVerticalScrollIndicator(let showsVerticalScrollIndicator):
                                return showsVerticalScrollIndicator
                            default:
                                return nil
                        }
                    }
                    var scrollIndicatorInsets: UIEdgeInsets? {
                        switch self {
                            case .scrollIndicatorInsets(let scrollIndicatorInsets):
                                return scrollIndicatorInsets
                            default:
                                return nil
                        }
                    }
                    var indicatorStyle: UIScrollViewIndicatorStyle? {
                        switch self {
                            case .indicatorStyle(let indicatorStyle):
                                return indicatorStyle
                            default:
                                return nil
                        }
                    }
                    var decelerationRate: CGFloat? {
                        switch self {
                            case .decelerationRate(let decelerationRate):
                                return decelerationRate
                            default:
                                return nil
                        }
                    }
                    var delaysContentTouches: Bool? {
                        switch self {
                            case .delaysContentTouches(let delaysContentTouches):
                                return delaysContentTouches
                            default:
                                return nil
                        }
                    }
                    var canCancelContentTouches: Bool? {
                        switch self {
                            case .canCancelContentTouches(let canCancelContentTouches):
                                return canCancelContentTouches
                            default:
                                return nil
                        }
                    }
                    var minimumZoomScale: CGFloat? {
                        switch self {
                            case .minimumZoomScale(let minimumZoomScale):
                                return minimumZoomScale
                            default:
                                return nil
                        }
                    }
                    var maximumZoomScale: CGFloat? {
                        switch self {
                            case .maximumZoomScale(let maximumZoomScale):
                                return maximumZoomScale
                            default:
                                return nil
                        }
                    }
                    var zoomScale: CGFloat? {
                        switch self {
                            case .zoomScale(let zoomScale):
                                return zoomScale
                            default:
                                return nil
                        }
                    }
                    var bouncesZoom: Bool? {
                        switch self {
                            case .bouncesZoom(let bouncesZoom):
                                return bouncesZoom
                            default:
                                return nil
                        }
                    }
                    var scrollsToTop: Bool? {
                        switch self {
                            case .scrollsToTop(let scrollsToTop):
                                return scrollsToTop
                            default:
                                return nil
                        }
                    }
                    var keyboardDismissMode: UIScrollViewKeyboardDismissMode? {
                        switch self {
                            case .keyboardDismissMode(let keyboardDismissMode):
                                return keyboardDismissMode
                            default:
                                return nil
                        }
                    }
                    var states: [ControlState]? {
                        switch self {
                            case .states(let states):
                                return states
                            default:
                                return nil
                        }
                    }
                    var target: Actor? {
                        switch self {
                            case .target(let target):
                                return target
                            default:
                                return nil
                        }
                    }
                    var enabled: Bool? {
                        switch self {
                            case .enabled(let enabled):
                                return enabled
                            default:
                                return nil
                        }
                    }
                    var selected: Bool? {
                        switch self {
                            case .selected(let selected):
                                return selected
                            default:
                                return nil
                        }
                    }
                    var highlighted: Bool? {
                        switch self {
                            case .highlighted(let highlighted):
                                return highlighted
                            default:
                                return nil
                        }
                    }
                    var contentEdgeInsets: UIEdgeInsets? {
                        switch self {
                            case .contentEdgeInsets(let contentEdgeInsets):
                                return contentEdgeInsets
                            default:
                                return nil
                        }
                    }
                    var titleEdgeInsets: UIEdgeInsets? {
                        switch self {
                            case .titleEdgeInsets(let titleEdgeInsets):
                                return titleEdgeInsets
                            default:
                                return nil
                        }
                    }
                    var reversesTitleShadowWhenHighlighted: Bool? {
                        switch self {
                            case .reversesTitleShadowWhenHighlighted(let reversesTitleShadowWhenHighlighted):
                                return reversesTitleShadowWhenHighlighted
                            default:
                                return nil
                        }
                    }
                    var imageEdgeInsets: UIEdgeInsets? {
                        switch self {
                            case .imageEdgeInsets(let imageEdgeInsets):
                                return imageEdgeInsets
                            default:
                                return nil
                        }
                    }
                    var adjustsImageWhenHighlighted: Bool? {
                        switch self {
                            case .adjustsImageWhenHighlighted(let adjustsImageWhenHighlighted):
                                return adjustsImageWhenHighlighted
                            default:
                                return nil
                        }
                    }
                    var adjustsImageWhenDisabled: Bool? {
                        switch self {
                            case .adjustsImageWhenDisabled(let adjustsImageWhenDisabled):
                                return adjustsImageWhenDisabled
                            default:
                                return nil
                        }
                    }
                    var showsTouchWhenHighlighted: Bool? {
                        switch self {
                            case .showsTouchWhenHighlighted(let showsTouchWhenHighlighted):
                                return showsTouchWhenHighlighted
                            default:
                                return nil
                        }
                    }
                    var axis: UILayoutConstraintAxis? {
                        switch self {
                            case .axis(let axis):
                                return axis
                            default:
                                return nil
                        }
                    }
                    var distribution: UIStackViewDistribution? {
                        switch self {
                            case .distribution(let distribution):
                                return distribution
                            default:
                                return nil
                        }
                    }
                    var alignment: UIStackViewAlignment? {
                        switch self {
                            case .alignment(let alignment):
                                return alignment
                            default:
                                return nil
                        }
                    }
                    var spacing: CGFloat? {
                        switch self {
                            case .spacing(let spacing):
                                return spacing
                            default:
                                return nil
                        }
                    }
                    var margin: CGFloat? {
                        switch self {
                            case .margin(let margin):
                                return margin
                            default:
                                return nil
                        }
                    }
                    var marginsRelative: Bool? {
                        switch self {
                            case .marginsRelative(let marginsRelative):
                                return marginsRelative
                            default:
                                return nil
                        }
                    }
                    var baselineRelative: Bool? {
                        switch self {
                            case .baselineRelative(let baselineRelative):
                                return baselineRelative
                            default:
                                return nil
                        }
                    }
                    var arrangedSubviews: [UIView]? {
                        switch self {
                            case .arrangedSubviews(let arrangedSubviews):
                                return arrangedSubviews
                            default:
                                return nil
                        }
                    }
                    var registerCells: [RegisterableCell]? {
                        switch self {
                            case .registerCells(let registerCells):
                                return registerCells
                            default:
                                return nil
                        }
                    }
                    var collectionViewLayout: UICollectionViewLayout? {
                        switch self {
                            case .collectionViewLayout(let collectionViewLayout):
                                return collectionViewLayout
                            default:
                                return nil
                        }
                    }
                    var itemSize: CGSize? {
                        switch self {
                            case .itemSize(let itemSize):
                                return itemSize
                            default:
                                return nil
                        }
                    }
                    var prompt: String? {
                        switch self {
                            case .prompt(let prompt):
                                return prompt
                            default:
                                return nil
                        }
                    }
                    var searchBarStyle: UISearchBarStyle? {
                        switch self {
                            case .searchBarStyle(let searchBarStyle):
                                return searchBarStyle
                            default:
                                return nil
                        }
                    }
                    var segments: [Segment]? {
                        switch self {
                            case .segments(let segments):
                                return segments
                            default:
                                return nil
                        }
                    }
                    var thumbTintColor: UIColor? {
                        switch self {
                            case .thumbTintColor(let thumbTintColor):
                                return thumbTintColor
                            default:
                                return nil
                        }
                    }
                    var on: Bool? {
                        switch self {
                            case .on(let on):
                                return on
                            default:
                                return nil
                        }
                    }
                    var onTintColor: UIColor? {
                        switch self {
                            case .onTintColor(let onTintColor):
                                return onTintColor
                            default:
                                return nil
                        }
                    }
                    var onImage: UIImage? {
                        switch self {
                            case .onImage(let onImage):
                                return onImage
                            default:
                                return nil
                        }
                    }
                    var offImge: UIImage? {
                        switch self {
                            case .offImge(let offImge):
                                return offImge
                            default:
                                return nil
                        }
                    }
                    var sliderValue: Double? {
                        switch self {
                            case .sliderValue(let sliderValue):
                                return sliderValue
                            default:
                                return nil
                        }
                    }
                    var sliderRange: Range<Double>? {
                        switch self {
                            case .sliderRange(let sliderRange):
                                return sliderRange
                            default:
                                return nil
                        }
                    }
        }

        public enum ViewAttributeStripped: String, StrippedRepresentation {
            case custom
            case delegate
            case dataSource
            case dataSourceDelegate
            case hidden
            case backgroundColor
            case verticalHugging
            case verticalCompression
            case horizontalHugging
            case horizontalCompression
            case contentMode
            case height
            case width
            case layoutMargins
            case userInteractable
            case tintColor
            case clipsToBounds
            case alpha
            case opaque
            case exclusiveTouch
            case multipleTouchEnabled
            case clearsContextBeforeDrawing
            case cornerRadius
            case radius
            case borderWidth
            case borderColor
            case text
            case font
            case textColor
            case `case`
            case textAlignment
            case adjustsFontSizeToFitWidth
            case placeholder
            case editable
            case clearsOnInsertion
            case clearsOnBeginEditing
            case numberOfLines
            case highlightedTextColor
            case minimumScaleFactor
            case baselineAdjustment
            case shadowColor
            case shadowOffset
            case clearButtonMode
            case borderStyle
            case selectedRange
            case image
            case scrollEnabled
            case contentSize
            case contentInset
            case bounces
            case alwaysBounceVertical
            case alwaysBounceHorizontal
            case pagingEnabled
            case showsHorizontalScrollIndicator
            case showsVerticalScrollIndicator
            case scrollIndicatorInsets
            case indicatorStyle
            case decelerationRate
            case delaysContentTouches
            case canCancelContentTouches
            case minimumZoomScale
            case maximumZoomScale
            case zoomScale
            case bouncesZoom
            case scrollsToTop
            case keyboardDismissMode
            case states
            case target
            case enabled
            case selected
            case highlighted
            case contentEdgeInsets
            case titleEdgeInsets
            case reversesTitleShadowWhenHighlighted
            case imageEdgeInsets
            case adjustsImageWhenHighlighted
            case adjustsImageWhenDisabled
            case showsTouchWhenHighlighted
            case axis
            case distribution
            case alignment
            case spacing
            case margin
            case marginsRelative
            case baselineRelative
            case arrangedSubviews
            case registerCells
            case collectionViewLayout
            case itemSize
            case prompt
            case searchBarStyle
            case segments
            case thumbTintColor
            case on
            case onTintColor
            case onImage
            case offImge
            case sliderValue
            case sliderRange
        } 

        extension ViewAttributeStripped {
            public var hashValue: Int {
                return rawValue.hashValue
            }

        }

        extension ViewAttribute: Hashable {
            public var hashValue: Int {
                return stripped.hashValue
            }
        }
        extension ViewAttribute: AssociatedValueStrippable {
        	public static func == (lhs: ViewAttribute, rhs: ViewAttribute) -> Bool {
        	    return lhs.stripped == rhs.stripped
        	}
            public typealias Stripped = ViewAttributeStripped
            public var stripped: Stripped {
        		switch self {
        			 case .custom:
        				return .custom
        			 case .delegate:
        				return .delegate
        			 case .dataSource:
        				return .dataSource
        			 case .dataSourceDelegate:
        				return .dataSourceDelegate
        			 case .hidden:
        				return .hidden
        			 case .backgroundColor:
        				return .backgroundColor
        			 case .verticalHugging:
        				return .verticalHugging
        			 case .verticalCompression:
        				return .verticalCompression
        			 case .horizontalHugging:
        				return .horizontalHugging
        			 case .horizontalCompression:
        				return .horizontalCompression
        			 case .contentMode:
        				return .contentMode
        			 case .height:
        				return .height
        			 case .width:
        				return .width
        			 case .layoutMargins:
        				return .layoutMargins
        			 case .userInteractable:
        				return .userInteractable
        			 case .tintColor:
        				return .tintColor
        			 case .clipsToBounds:
        				return .clipsToBounds
        			 case .alpha:
        				return .alpha
        			 case .opaque:
        				return .opaque
        			 case .exclusiveTouch:
        				return .exclusiveTouch
        			 case .multipleTouchEnabled:
        				return .multipleTouchEnabled
        			 case .clearsContextBeforeDrawing:
        				return .clearsContextBeforeDrawing
        			 case .cornerRadius:
        				return .cornerRadius
        			 case .radius:
        				return .radius
        			 case .borderWidth:
        				return .borderWidth
        			 case .borderColor:
        				return .borderColor
        			 case .text:
        				return .text
        			 case .font:
        				return .font
        			 case .textColor:
        				return .textColor
        			 case .`case`:
        				return .`case`
        			 case .textAlignment:
        				return .textAlignment
        			 case .adjustsFontSizeToFitWidth:
        				return .adjustsFontSizeToFitWidth
        			 case .placeholder:
        				return .placeholder
        			 case .editable:
        				return .editable
        			 case .clearsOnInsertion:
        				return .clearsOnInsertion
        			 case .clearsOnBeginEditing:
        				return .clearsOnBeginEditing
        			 case .numberOfLines:
        				return .numberOfLines
        			 case .highlightedTextColor:
        				return .highlightedTextColor
        			 case .minimumScaleFactor:
        				return .minimumScaleFactor
        			 case .baselineAdjustment:
        				return .baselineAdjustment
        			 case .shadowColor:
        				return .shadowColor
        			 case .shadowOffset:
        				return .shadowOffset
        			 case .clearButtonMode:
        				return .clearButtonMode
        			 case .borderStyle:
        				return .borderStyle
        			 case .selectedRange:
        				return .selectedRange
        			 case .image:
        				return .image
        			 case .scrollEnabled:
        				return .scrollEnabled
        			 case .contentSize:
        				return .contentSize
        			 case .contentInset:
        				return .contentInset
        			 case .bounces:
        				return .bounces
        			 case .alwaysBounceVertical:
        				return .alwaysBounceVertical
        			 case .alwaysBounceHorizontal:
        				return .alwaysBounceHorizontal
        			 case .pagingEnabled:
        				return .pagingEnabled
        			 case .showsHorizontalScrollIndicator:
        				return .showsHorizontalScrollIndicator
        			 case .showsVerticalScrollIndicator:
        				return .showsVerticalScrollIndicator
        			 case .scrollIndicatorInsets:
        				return .scrollIndicatorInsets
        			 case .indicatorStyle:
        				return .indicatorStyle
        			 case .decelerationRate:
        				return .decelerationRate
        			 case .delaysContentTouches:
        				return .delaysContentTouches
        			 case .canCancelContentTouches:
        				return .canCancelContentTouches
        			 case .minimumZoomScale:
        				return .minimumZoomScale
        			 case .maximumZoomScale:
        				return .maximumZoomScale
        			 case .zoomScale:
        				return .zoomScale
        			 case .bouncesZoom:
        				return .bouncesZoom
        			 case .scrollsToTop:
        				return .scrollsToTop
        			 case .keyboardDismissMode:
        				return .keyboardDismissMode
        			 case .states:
        				return .states
        			 case .target:
        				return .target
        			 case .enabled:
        				return .enabled
        			 case .selected:
        				return .selected
        			 case .highlighted:
        				return .highlighted
        			 case .contentEdgeInsets:
        				return .contentEdgeInsets
        			 case .titleEdgeInsets:
        				return .titleEdgeInsets
        			 case .reversesTitleShadowWhenHighlighted:
        				return .reversesTitleShadowWhenHighlighted
        			 case .imageEdgeInsets:
        				return .imageEdgeInsets
        			 case .adjustsImageWhenHighlighted:
        				return .adjustsImageWhenHighlighted
        			 case .adjustsImageWhenDisabled:
        				return .adjustsImageWhenDisabled
        			 case .showsTouchWhenHighlighted:
        				return .showsTouchWhenHighlighted
        			 case .axis:
        				return .axis
        			 case .distribution:
        				return .distribution
        			 case .alignment:
        				return .alignment
        			 case .spacing:
        				return .spacing
        			 case .margin:
        				return .margin
        			 case .marginsRelative:
        				return .marginsRelative
        			 case .baselineRelative:
        				return .baselineRelative
        			 case .arrangedSubviews:
        				return .arrangedSubviews
        			 case .registerCells:
        				return .registerCells
        			 case .collectionViewLayout:
        				return .collectionViewLayout
        			 case .itemSize:
        				return .itemSize
        			 case .prompt:
        				return .prompt
        			 case .searchBarStyle:
        				return .searchBarStyle
        			 case .segments:
        				return .segments
        			 case .thumbTintColor:
        				return .thumbTintColor
        			 case .on:
        				return .on
        			 case .onTintColor:
        				return .onTintColor
        			 case .onImage:
        				return .onImage
        			 case .offImge:
        				return .offImge
        			 case .sliderValue:
        				return .sliderValue
        			 case .sliderRange:
        				return .sliderRange
        		}
        	}
        }


extension Collection where Iterator.Element: AssociatedValueStrippable, Iterator.Element: Hashable {
    func contains<Stripped: StrippedRepresentation>(_ element: Stripped) -> Bool where Stripped == Iterator.Element.Stripped {
        return map { $0.stripped }.contains(element)
    }
}

extension Collection where Iterator.Element: AssociatedValueStrippable, Iterator.Element: AssociatedValueEnumExtractor {
    func associatedValue<AssociatedValue, Stripped: StrippedRepresentation>(_ element: Stripped) -> AssociatedValue? where Stripped == Iterator.Element.Stripped {
        for item in self {
            guard item.stripped == element else { continue }
            return item.associatedValueTyped()
        }
        return nil
    }
}
