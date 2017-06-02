//
//  TriangleViewController.swift
//  Example
//
//  Created by Alexander Cyon on 2017-06-02.
//  Copyright © 2017 Alexander Cyon. All rights reserved.
//

import UIKit
import ViewComposer

class TriangleViewController: UIViewController, StackViewOwner {
    private lazy var triangleViewA: TriangleView = [.custom(TriangleViewStyle([.fillColor(.green), .fillStyle(.lowerAcute)])), .backgroundColor(.red)]
    private lazy var triangleViewB: TriangleView = [.custom(TriangleViewStyle([.fillColor(.green), .fillStyle(.lowerGrave)])), .backgroundColor(.blue)]
    private lazy var triangleViewC: TriangleView = [.custom(TriangleViewStyle([.fillColor(.yellow), .fillStyle(.upperAcute)])), .backgroundColor(.orange)]
    private lazy var triangleViewD: TriangleView = [.custom(TriangleViewStyle([.fillColor(.yellow), .fillStyle(.upperGrave)])), .backgroundColor(.red)]
    lazy var stackView: UIStackView = .make([.arrangedSubviews([self.triangleViewA, self.triangleViewB, self.triangleViewC, self.triangleViewD]), .axis(.vertical), .distribution(.fillEqually)])
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        view.backgroundColor = .brown
        title = "ViewComposer - TriangleView"
    }
}
