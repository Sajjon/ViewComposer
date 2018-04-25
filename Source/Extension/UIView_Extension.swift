//
//  UIView_Extension.swift
//  ViewComposer1
//
//  Created by Alexander Cyon on 2018-04-25.
//  Copyright © 2018 cyon. All rights reserved.
//

import UIKit

extension UIView {
    func edgesToSuperView() {
        guard let superview = superview else { return }
        topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
    }
}

final class Spacer: UIView {
    let height: CGFloat
    init(height: CGFloat = UIViewNoIntrinsicMetric, color: UIColor = .white) {
        self.height = height
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = color
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: height)
    }
}

extension UIView {
    static var spacer: Spacer { return Spacer() }
    static func spacer(_ height: CGFloat = UIViewNoIntrinsicMetric, color: UIColor = .white) -> Spacer {
        return Spacer(height: height, color: color)
    }
}

