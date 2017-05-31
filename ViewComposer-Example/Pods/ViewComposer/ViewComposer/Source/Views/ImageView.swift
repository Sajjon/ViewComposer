//
//  ImageView.swift
//  Breeze
//
//  Created by Alexander Cyon on 2017-05-04.
//  Copyright © 2017 Nordic Choice Hotels. All rights reserved.
//

import Foundation

final class ImageView: UIImageView {
    
    fileprivate let style: ViewStyle
    
    init(_ image: UIImage? = nil, _ style: ViewStyle = .default) {
        self.style = style
        super.init(frame: .zero)
        setup(with: style)
        self.image = image
    }
    
    required init?(coder: NSCoder) { requiredInit() }
    
}

extension ImageView {
    convenience init(_ image: UIImage? = nil, _ look: [ViewAttribute]) {
        self.init(image, ViewStyle(look))
    }
    
    convenience init(_ asset: Asset, _ look: [ViewAttribute]) {
        self.init(asset.image, ViewStyle(look))
    }
    
    convenience init(_ asset: Asset, _ style: ViewStyle = .default) {
        self.init(asset.image, style)
    }
}

private extension ImageView {
    func setup(with style: ViewStyle) {
        translatesAutoresizingMaskIntoConstraints = false
        style.apply(to: self)
    }
}

private extension ViewStyle {
    @nonobjc static let `default`: ViewStyle = .empty
}

