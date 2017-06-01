//
//  ViewController.swift
//  ViewComposer-Example
//
//  Created by Alexander Cyon on 2017-05-30.
//  Copyright © 2017 Alexander Cyon. All rights reserved.
//

import UIKit
import ViewComposer

class ViewController: UIViewController {
    private lazy var redButton = UIButton.make([.backgroundColor(.red), .text("Red"), .textColor(.blue)])
    private lazy var blueButton: UIButton = .make([.backgroundColor(.blue), .states([.normal("Blue", nil)]), .textColor(.red)])
    private lazy var buttons: UIStackView = .make([.arrangedSubviews([self.redButton, self.blueButton]), .distribution(.fillEqually)])
    
    private lazy var yellowButton: UIButton = .make([.backgroundColor(.yellow), .text("Yellow"), .textColor(.red)])
    private lazy var label: UILabel = .make([.text("Hey ViewComposer user"), .textAlignment(.center)])
    
    fileprivate lazy var stackView: StackView = [.arrangedSubviews([self.buttons, self.yellowButton, self.label]), .axis(.vertical), .distribution(.fillEqually)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

private extension ViewController {
    func setupViews() {
        view.addSubview(stackView)
        view.addConstraint(stackView.topAnchor.constraint(equalTo: view.topAnchor))
        view.addConstraint(stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        view.addConstraint(stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        view.addConstraint(stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
    }
}
