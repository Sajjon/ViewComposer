//
//  UIActivityIndicatorView+Makeable.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-13.
//
//

import Foundation

extension UIActivityIndicatorView: Makeable {
    public typealias Style = ViewStyle
    public static func createEmpty() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicator.startAnimating()
        return activityIndicator
    }
}
