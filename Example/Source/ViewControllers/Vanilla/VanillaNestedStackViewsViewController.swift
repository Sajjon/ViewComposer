//
//  VanillaNestedStackViewsViewController.swift
//  Example
//
//  Created by Alexander Cyon on 2017-06-01.
//  Copyright © 2017 Alexander Cyon. All rights reserved.
//

import UIKit

class VanillaNestedStackViewsViewController: UIViewController, StackViewOwner {
    
    private lazy var redButton: UIButton = {
        let redButton = UIButton()
        redButton.translatesAutoresizingMaskIntoConstraints = false
        redButton.backgroundColor = .red
        redButton.setTitle("Red", for: .normal)
        redButton.setTitleColor(.blue, for: .normal)
        return redButton
    }()
    
    private lazy var blueButton: UIButton = {
        let blueButton = UIButton()
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.backgroundColor = .blue
        blueButton.setTitle("Blue", for: .normal)
        blueButton.setTitleColor(.red, for: .normal)
        return blueButton
    }()
    
    private lazy var buttons: UIStackView = {
        let buttons = UIStackView(arrangedSubviews: [self.redButton, self.blueButton])
        buttons.translatesAutoresizingMaskIntoConstraints = false
        buttons.distribution = .fillEqually
        return buttons
    }()
    
    private lazy var yellowButton: UIButton = {
        let yellowButton = UIButton()
        yellowButton.translatesAutoresizingMaskIntoConstraints = false
        yellowButton.backgroundColor = .yellow
        yellowButton.setTitle("Yellow", for: .normal)
        yellowButton.setTitleColor(.red, for: .normal)
        return yellowButton
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hey ViewComposer user"
        label.textAlignment = .center
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.buttons, self.yellowButton, self.label])
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        title = "Vanilla - Nested StackViews"
    }
}

protocol StackViewOwner {
    var stackView: UIStackView { get set }
}

extension StackViewOwner where Self: UIViewController {
    func setupViews() {
        edgesForExtendedLayout = []
        automaticallyAdjustsScrollViewInsets = false
        view.addSubview(stackView)
        view.addConstraint(stackView.topAnchor.constraint(equalTo: view.topAnchor))
        view.addConstraint(stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        view.addConstraint(stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        view.addConstraint(stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
    }
}
