//
//  TextHolder.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-31.
//
//

import Foundation

public protocol TextHolder: class {
    var textProxy: String? { get set }
    var textColorProxy: UIColor? { get set }
    var fontProxy: UIFont? { get set }
    var textAlignmentProxy: NSTextAlignment { get set }
    func setText(_ text: String?)
    func setFont(_ font: UIFont)
    func setTextColor(_ textColor: UIColor)
    func setTextAlignment(_ textAlignment: NSTextAlignment)
    func setCase(_ `case`: Case)
}

internal extension TextHolder {
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

public extension TextHolder {
    
    func setText(_ text: String?) {
        textProxy = text
    }
    
    func setFont(_ font: UIFont) {
        fontProxy = font
    }
    
    func setTextColor(_ textColor: UIColor) {
        textColorProxy = textColor
    }
    
    func setTextAlignment(_ textAlignment: NSTextAlignment) {
        textAlignmentProxy = textAlignment
    }
    
    func setCase(_ `case`: Case) {
        textProxy = `case`.apply(to: textProxy)
    }
}

extension UILabel: TextHolder {
    public var textAlignmentProxy: NSTextAlignment {
        get { return textAlignment }
        set { textAlignment = newValue }
    }
    
    public var fontProxy: UIFont? {
        get { return font }
        set { font = newValue }
    }
    
    public var textProxy: String? {
        get { return text }
        set { text = newValue }
    }
    
    public var textColorProxy: UIColor? {
        get { return textColor }
        set { textColor = newValue }
    }
}

extension UITextField: TextHolder {
    public var textAlignmentProxy: NSTextAlignment {
        get { return textAlignment }
        set { textAlignment = newValue }
    }
    
    public var fontProxy: UIFont? {
        get { return font }
        set { font = newValue }
    }
    
    public var textProxy: String? {
        get { return text }
        set { text = newValue }
    }
    
    public var textColorProxy: UIColor? {
        get { return textColor }
        set { textColor = newValue }
    }
}

extension UITextView: TextHolder {
    public var textAlignmentProxy: NSTextAlignment {
        get { return textAlignment }
        set { textAlignment = newValue }
    }
    
    public var fontProxy: UIFont? {
        get { return font }
        set { font = newValue }
    }
    
    public var textProxy: String? {
        get { return text }
        set { text = newValue }
    }
    
    public var textColorProxy: UIColor? {
        get { return textColor }
        set { textColor = newValue }
    }
}

extension UIButton: TextHolder {
    public var textAlignmentProxy: NSTextAlignment {
        get { guard let label = titleLabel else { return .left }; return label.textAlignment }
        set { titleLabel?.textAlignment = newValue }
    }
    
    public var fontProxy: UIFont? {
        get { return titleLabel?.font }
        set { titleLabel?.font = newValue }
    }
    
    public var textProxy: String? {
        get { return titleLabel?.text }
        set { setTitle(newValue, for: .normal) }
    }
    
    public var textColorProxy: UIColor? {
        get { return titleLabel?.textColor }
        set { setTitleColor(newValue, for: .normal) }
    }
}

extension UISearchBar: TextHolder {
    public var textAlignmentProxy: NSTextAlignment {
        get { return UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).textAlignment }
        set { /* nothing to do */ }
    }
    
    public var fontProxy: UIFont? {
        get { return UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).font }
        set { /* nothing to do */ }
    }
    
    public var textProxy: String? {
        get { return text }
        set { text = newValue }
    }
    
    public var textColorProxy: UIColor? {
        get { return UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).textColor }
        set { /* nothing to do */ }
    }
}
