//
//  VanillaViewController.swift
//  Example
//
//  Created by Alexander Cyon on 2017-06-01.
//  Copyright © 2017 Alexander Cyon. All rights reserved.
//

import UIKit

class VanillaViewController: UIViewController, StackViewOwner {
    
    private lazy var redButton: UIButton = {
        let redButton = UIButton()
        redButton.backgroundColor = .red
        redButton.setTitle("Red", for: .normal)
        redButton.setTitleColor(.blue, for: .normal)
        return redButton
    }()
    
    private lazy var blueButton: UIButton = {
        let redButton = UIButton()
        redButton.backgroundColor = .blue
        redButton.setTitle("Blue", for: .normal)
        redButton.setTitleColor(.red, for: .normal)
        return redButton
    }()
    
    private lazy var buttons: UIStackView = {
        let buttons = UIStackView(arrangedSubviews: [self.redButton, self.blueButton])
        buttons.distribution = .fillEqually
        return buttons
    }()
    
    private lazy var yellowButton: UIButton = {
        let yellowButton = UIButton()
        yellowButton.backgroundColor = .yellow
        yellowButton.setTitle("Yellow", for: .normal)
        yellowButton.setTitleColor(.red, for: .normal)
        return yellowButton
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Hey ViewComposer user"
        label.textAlignment = .center
        return label
    }()
    
    
    lazy var stackView: UIStackView = {
        let buttons = UIStackView(arrangedSubviews: [self.buttons, self.yellowButton, self.label])
        buttons.distribution = .fillEqually
        buttons.axis = .vertical
        return buttons
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

protocol StackViewOwner {
    var stackView: UIStackView { get set }
}

extension StackViewOwner where Self: UIViewController {
    func setupViews() {
        view.addSubview(stackView)
        view.addConstraint(stackView.topAnchor.constraint(equalTo: view.topAnchor))
        view.addConstraint(stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        view.addConstraint(stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        view.addConstraint(stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
    }
}
