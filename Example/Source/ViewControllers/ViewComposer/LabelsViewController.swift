//
//  LabelsViewController.swift
//  Example
//
//  Created by Alexander Cyon on 2017-06-01.
//  Copyright © 2017 Alexander Cyon. All rights reserved.
//

import UIKit
import ViewComposer

private let labelStyle: ViewStyle = [.textColor(.red), .textAlignment(.center), .font(.boldSystemFont(ofSize: 30)), .color(.yellow)]
class LabelsViewController: UIViewController, StackViewOwner {
    
    private lazy var fooLabel: UILabel = labelStyle <<- .text("Foo")
    private lazy var barLabel: UILabel = labelStyle <<- [.text("Bar"), .textColor(.blue), .color(.red)]
    private lazy var bazLabel: UILabel = labelStyle <<- [.text("Baz"), .textAlignment(.left), .color(.green), .font(.boldSystemFont(ofSize: 45))]
    
    lazy var stackView: UIStackView = StackView([.views([self.fooLabel, self.barLabel, self.bazLabel]), .distribution(.fillEqually), .color(.blue), .spacing(50), .layoutMargins(all: 40), .marginsRelative(true)])
    
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
