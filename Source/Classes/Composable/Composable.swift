//
//  Composable.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-06.
//
//

import Foundation

/// Type that can be instantiated using a `Style`. This is neat if you want to create your own styleable type.
public protocol Composable: Styleable {
    init(_ style: Style?)
    
    /// This method is called after the `Composable` itself has been created using `init(Style)`. Here you can setup subviews using the same `style` that was used to instantiate the `Composable`.
    ///
    /// This method is "optional", since there is a default implementation of it in an extension of the `Composable` protocol.
    ///
    /// - Parameter style: the `Style` associated with the Composable containing all the attributes that where used to create the `Composable` itself.
    func setupSubviews(with style: Style)
}

extension Composable {
    /* Making the method "optional" */
    public func setupSubviews(with style: Style) {}
}

