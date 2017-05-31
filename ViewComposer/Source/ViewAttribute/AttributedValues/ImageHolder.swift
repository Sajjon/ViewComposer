//
//  ImageHolder.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-31.
//
//

import UIKit

public protocol ImageHolder: class {
    var imageProxy: UIImage? { get set}
}

extension ImageHolder {
    @discardableResult
    func setImage(_ image: UIImage?) -> Self {
        imageProxy = image
        return self
    }
    
//    @discardableResult
//    func setImage(_ image: Asset?) -> Self {
//        imageProxy = image?.image
//        return self
//    }
}

extension UIImageView: ImageHolder {
    public var imageProxy: UIImage? {
        get { return image }
        set { image = newValue }
    }
}

extension UIButton: ImageHolder {
    public var imageProxy: UIImage? {
        get { return self.image(for: .normal) }
        set { setImage(newValue, for: .normal) }
    }
}
