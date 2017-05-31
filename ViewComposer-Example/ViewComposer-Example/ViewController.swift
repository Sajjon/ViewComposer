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
    lazy var redButton = UIButton.make([.backgroundColor(.red)])
    lazy var blueButton: UIButton = .make([.backgroundColor(.blue)])
}
