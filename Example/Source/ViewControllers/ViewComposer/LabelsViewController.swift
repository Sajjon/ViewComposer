//
//  LabelsViewController.swift
//  Example
//
//  Created by Alexander Cyon on 2017-06-01.
//  Copyright © 2017 Alexander Cyon. All rights reserved.
//

import UIKit
import ViewComposer

private let labelStyle: ViewStyle = [.textColor(.red), .textAlignment(.center), .font(.boldSystemFont(ofSize: 30))]
class LabelsViewController: UIViewController, StackViewOwner {
    
    private lazy var fooLabel: UILabel = labelStyle <<- .text("Foo")
    private lazy var barLabel: UILabel = labelStyle <<- [.text("Bar"), .textColor(.blue), .backgroundColor(.red)]
    private lazy var bazLabel: UILabel = labelStyle <<- [.text("Baz"), .textAlignment(.left), .backgroundColor(.green), .font(.boldSystemFont(ofSize: 45))]
    
    lazy var stackView: UIStackView = [.arrangedSubviews([self.fooLabel, self.barLabel, self.bazLabel]), .axis(.vertical), .distribution(.fillEqually)]
    
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
        title = "ViewComposer - Labels"
    }
}
