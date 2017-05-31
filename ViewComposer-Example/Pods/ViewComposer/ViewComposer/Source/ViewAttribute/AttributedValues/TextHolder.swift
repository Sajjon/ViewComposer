//
//  TextHolder.swift
//  Breeze
//
//  Created by Alexander Cyon on 2017-05-29.
//  Copyright © 2017 Nordic Choice Hotels. All rights reserved.
//

import Foundation

protocol TextHolder: class {
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

extension TextHolder {
    
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
    var textAlignmentProxy: NSTextAlignment {
        get { return textAlignment }
        set { textAlignment = newValue }
    }
    
    var fontProxy: UIFont? {
        get { return font }
        set { font = newValue }
    }
    
    var textProxy: String? {
        get { return text }
        set { text = newValue }
    }
    
    var textColorProxy: UIColor? {
        get { return textColor }
        set { textColor = newValue }
    }
}

extension UITextField: TextHolder {
    var textAlignmentProxy: NSTextAlignment {
        get { return textAlignment }
        set { textAlignment = newValue }
    }
    
    var fontProxy: UIFont? {
        get { return font }
        set { font = newValue }
    }
    
    var textProxy: String? {
        get { return text }
        set { text = newValue }
    }
    
    var textColorProxy: UIColor? {
        get { return textColor }
        set { textColor = newValue }
    }
}

extension UITextView: TextHolder {
    var textAlignmentProxy: NSTextAlignment {
        get { return textAlignment }
        set { textAlignment = newValue }
    }
    
    var fontProxy: UIFont? {
        get { return font }
        set { font = newValue }
    }
    
    var textProxy: String? {
        get { return text }
        set { text = newValue }
    }
    
    var textColorProxy: UIColor? {
        get { return textColor }
        set { textColor = newValue }
    }
}

extension UIButton: TextHolder {
    var textAlignmentProxy: NSTextAlignment {
        get { guard let label = titleLabel else { return .left }; return label.textAlignment }
        set { titleLabel?.textAlignment = newValue }
    }
    
    var fontProxy: UIFont? {
        get { return titleLabel?.font }
        set { titleLabel?.font = newValue }
    }
    
    var textProxy: String? {
        get { return titleLabel?.text }
        set { setTitle(newValue, for: .normal) }
    }
    
    var textColorProxy: UIColor? {
        get { return titleLabel?.textColor }
        set { setTitleColor(newValue, for: .normal) }
    }
}
