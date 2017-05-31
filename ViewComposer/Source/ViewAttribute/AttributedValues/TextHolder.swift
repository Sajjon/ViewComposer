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
//    @discardableResult func setText(_ text: L10n) -> Self
    func setText(_ text: String?)
//    @discardableResult func setFont(_ font: Font) -> Self
    func setTextColor(_ textColor: UIColor)
    func setTextAlignment(_ textAlignment: NSTextAlignment)
    func setCase(_ `case`: Case)
}

public extension TextHolder {
    
    func setText(_ text: String?) {
        textProxy = text
    }
    
//    @discardableResult
//    func setText(_ text: L10n) -> Self {
//        setText(text.string)
//        return self
//    }
//    
//    @discardableResult
//    func setFont(_ font: Font) -> Self {
//        fontProxy = font.font
//        return self
//    }
    
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
