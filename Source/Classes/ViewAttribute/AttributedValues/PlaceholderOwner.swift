//
//  PlaceholderOwner.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-01.
//
//

import Foundation

public protocol PlaceholderOwner: class {
    var placeholderProxy: String? { get set }
    func setPlaceholder(_ placeholder: String?)
}

public extension PlaceholderOwner {
    func setPlaceholder(_ placeholder: String?) {
        placeholderProxy = placeholder
    }
}

extension UITextField: PlaceholderOwner {
    public var placeholderProxy: String? {
        get { return placeholder }
        set { placeholder = newValue }
    }
}

extension UISearchBar: PlaceholderOwner {
    public var placeholderProxy: String? {
        get { return placeholder }
        set { placeholder = newValue }
    }
}

