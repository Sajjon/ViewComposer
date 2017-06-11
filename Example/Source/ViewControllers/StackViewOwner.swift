//
//  StackViewOwner.swift
//  Example
//
//  Created by Alexander Cyon on 2017-06-11.
//  Copyright © 2017 Alexander Cyon. All rights reserved.
//

import UIKit
import ViewComposer

protocol StackViewOwner {
    associatedtype StackViewType: UIStackView
    var stackView: StackViewType { get set }
    var parentView: UIView { get }
    func specialConfig()
}

extension StackViewOwner {
    func specialConfig() {}
}

extension StackViewOwner where Self: UIViewController {
    var parentView: UIView { return self.view }
    
    func specialConfig() {
        view.backgroundColor = .white
        edgesForExtendedLayout = []
        automaticallyAdjustsScrollViewInsets = false
    }
}

extension StackViewOwner {
    func setupViews() {
        parentView.addSubview(stackView)
        parentView.addConstraint(stackView.topAnchor.constraint(equalTo: parentView.topAnchor))
        parentView.addConstraint(stackView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor))
        parentView.addConstraint(stackView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor))
        let bottom = stackView.bottomAnchor.constraint(equalTo: parentView.bottomAnchor)
        bottom.priority = UILayoutPriorityDefaultHigh
        parentView.addConstraint(bottom)
        
        specialConfig()
    }
}
