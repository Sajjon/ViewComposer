//
//  TextInputting.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-10.
//
//

import Foundation


public protocol TextInputting: class {
    var editableProxy: Bool { get set} //used by `UITextView` but not by `UITextField`
    var clearsOnBeginEditingProxy: Bool { get set } //used by `UITextField` but not by `UITextView`
    var clearsOnInsertionProxy: Bool { get set}
}

extension TextInputting {
    @discardableResult
    func setEditable(_ editable: Bool) -> Self {
        editableProxy = editable
        return self
    }
    
    @discardableResult
    func setClearsOnInsertion(_ clearsOnInsertion: Bool) -> Self {
        clearsOnInsertionProxy = clearsOnInsertion
        return self
    }
    
    @discardableResult
    func setClearsOnBeginEditing(_ clearsOnBeginEditing: Bool) -> Self {
        clearsOnBeginEditingProxy = clearsOnBeginEditing
        return self
    }
}

extension UITextField: TextInputting {
    
    public var editableProxy: Bool {
        get { return false }
        set { /* ignored */}
    }
    
    public var clearsOnInsertionProxy: Bool {
        get { return clearsOnInsertion }
        set { clearsOnInsertion = newValue }
    }
    
    public var clearsOnBeginEditingProxy: Bool {
        get { return clearsOnBeginEditing }
        set { clearsOnBeginEditing = newValue }
    }
}

extension UITextView: TextInputting {
    public var editableProxy: Bool {
        get { return isEditable }
        set { isEditable = newValue }
    }
    
    public var clearsOnInsertionProxy: Bool {
        get { return clearsOnInsertion }
        set { clearsOnInsertion = newValue }
    }
    
    public var clearsOnBeginEditingProxy: Bool {
        get { return false }
        set { /* ignored */}
    }
}
