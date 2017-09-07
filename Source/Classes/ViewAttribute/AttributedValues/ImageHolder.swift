//
//  ImageHolder.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-31.
//
//

import UIKit

public protocol ImageHolderHolder: class {
    var imageHolder: ImageHolder? { get }
}

public protocol ImageHolder: class {
    var image: UIImage? { get set }
    var isHighlighted: Bool { get set}
    var highlightedImage: UIImage? { get set }
    var animationImages: [UIImage]? { get set }
    var highlightedAnimationImages: [UIImage]? { get set }
    var animationRepeatCount: Int { get set }
    var animationDuration: TimeInterval { get set }
}

extension UIImageView: ImageHolder {}

extension UIButton: ImageHolderHolder {
    public var imageHolder: ImageHolder? {
        return imageView
    }
}

internal extension ImageHolder {
    func apply(_ style: ViewStyle) {
        style.attributes.forEach {
            switch $0 {
            case .image(let image):
                self.image = image
            case .highlightedImage(let image):
                self.highlightedImage = image
            case .animationImages(let images):
                self.animationImages = images
            case .highlightedAnimationImages(let images):
                self.highlightedAnimationImages = images
            case .animationRepeatCount(let count):
                self.animationRepeatCount = count
            case .animationDuration(let duration):
                self.animationDuration = duration
            case .highlighted(let highlighted):
                self.isHighlighted = highlighted
            default:
                break
            }
        }
    }
}

internal extension ImageHolderHolder {
    func apply(_ style: ViewStyle) {
        guard let imageHolder = imageHolder else { return }
        imageHolder.apply(style)
    }
}
