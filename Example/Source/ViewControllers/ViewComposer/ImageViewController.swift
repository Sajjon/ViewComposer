//
//  ImageViewController.swift
//  Example
//
//  Created by Alexander Cyon on 2017-09-05.
//  Copyright © 2017 Alexander Cyon. All rights reserved.
//

import Foundation
import ViewComposer

private let imageSize: CGFloat = 600
final class ImageViewController: UIViewController, StackViewOwner {
    
    lazy var imageView: UIImageView = [.image(#imageLiteral(resourceName: "white")), .highlightedImage(#imageLiteral(resourceName: "red")), .height(imageSize), .width(imageSize), .contentMode(.scaleAspectFit), .highlighted(true)]
    

    var views: [UIView] { return [imageView] }
    lazy var stackView: UIStackView = .axis(.vertical) <- .views(self.views)
        <- [.spacing(20), .spacing(10), .distribution(.fillProportionally)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        title = "ViewComposer - ImageViewController"
    }
}
