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

        extension ControlState: AssociatedValueEnumExtractor {
            public var associatedValue: Any? {
                switch self {
                                case .normal(let normal):
                                    return normal
                                case .highlighted(let highlighted):
                                    return highlighted
                                case .disabled(let disabled):
                                    return disabled
                }
            }

                    var normal: StateRepresentation? {
                        switch self {
                            case .normal(let normal):
                                return normal
                            default:
                                return nil
                        }
                    }
                    var highlighted: StateRepresentation? {
                        switch self {
                            case .highlighted(let highlighted):
                                return highlighted
                            default:
                                return nil
                        }
                    }
                    var disabled: StateRepresentation? {
                        switch self {
                            case .disabled(let disabled):
                                return disabled
                            default:
                                return nil
                        }
                    }
        }

        public enum ControlStateStripped: String, StrippedRepresentation {
            case normal
            case highlighted
            case disabled
        } 

        extension ControlStateStripped {
            public var hashValue: Int {
                return rawValue.hashValue
            }

        }

        extension ControlState: Hashable {
            public var hashValue: Int {
                return stripped.hashValue
            }
        }
        extension ControlState: AssociatedValueStrippable {
        	public static func == (lhs: ControlState, rhs: ControlState) -> Bool {
        	    return lhs.stripped == rhs.stripped
        	}
            public typealias Stripped = ControlStateStripped
            public var stripped: Stripped {
        		switch self {
        			 case .normal:
        				return .normal
        			 case .highlighted:
        				return .highlighted
        			 case .disabled:
        				return .disabled
        		}
        	}
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
                                case .backgroundColor(let backgroundColor):
                                    return backgroundColor
                                case .cornerRadius(let cornerRadius):
                                    return cornerRadius
                                case .radius(let radius):
                                    return radius
                                case .verticalHugging(let verticalHugging):
                                    return verticalHugging
                                case .verticalCompression(let verticalCompression):
                                    return verticalCompression
                                case .horizontalHugging(let horizontalHugging):
                                    return horizontalHugging
                                case .horizontalCompression(let horizontalCompression):
                                    return horizontalCompression
                                case .height(let height):
                                    return height
                                case .width(let width):
                                    return width
                                case .text(let text):
                                    return text
                                case .textColor(let textColor):
                                    return textColor
                                case .`case`(let `case`):
                                    return `case`
                                case .textAlignment(let textAlignment):
                                    return textAlignment
                                case .image(let image):
                                    return image
                                case .isScrollEnabled(let isScrollEnabled):
                                    return isScrollEnabled
                                case .states(let states):
                                    return states
                                case .target(let target):
                                    return target
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
                                case .arrangedSubviews(let arrangedSubviews):
                                    return arrangedSubviews
                }
            }

                    var custom: AnyAttributed? {
                        switch self {
                            case .custom(let custom):
                                return custom
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
                    var text: String? {
                        switch self {
                            case .text(let text):
                                return text
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
                    var image: UIImage? {
                        switch self {
                            case .image(let image):
                                return image
                            default:
                                return nil
                        }
                    }
                    var isScrollEnabled: Bool? {
                        switch self {
                            case .isScrollEnabled(let isScrollEnabled):
                                return isScrollEnabled
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
                    var arrangedSubviews: [UIView]? {
                        switch self {
                            case .arrangedSubviews(let arrangedSubviews):
                                return arrangedSubviews
                            default:
                                return nil
                        }
                    }
        }

        public enum ViewAttributeStripped: String, StrippedRepresentation {
            case custom
            case backgroundColor
            case cornerRadius
            case radius
            case verticalHugging
            case verticalCompression
            case horizontalHugging
            case horizontalCompression
            case height
            case width
            case text
            case textColor
            case `case`
            case textAlignment
            case image
            case isScrollEnabled
            case states
            case target
            case axis
            case distribution
            case alignment
            case spacing
            case margin
            case arrangedSubviews
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
        			 case .backgroundColor:
        				return .backgroundColor
        			 case .cornerRadius:
        				return .cornerRadius
        			 case .radius:
        				return .radius
        			 case .verticalHugging:
        				return .verticalHugging
        			 case .verticalCompression:
        				return .verticalCompression
        			 case .horizontalHugging:
        				return .horizontalHugging
        			 case .horizontalCompression:
        				return .horizontalCompression
        			 case .height:
        				return .height
        			 case .width:
        				return .width
        			 case .text:
        				return .text
        			 case .textColor:
        				return .textColor
        			 case .`case`:
        				return .`case`
        			 case .textAlignment:
        				return .textAlignment
        			 case .image:
        				return .image
        			 case .isScrollEnabled:
        				return .isScrollEnabled
        			 case .states:
        				return .states
        			 case .target:
        				return .target
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
        			 case .arrangedSubviews:
        				return .arrangedSubviews
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
