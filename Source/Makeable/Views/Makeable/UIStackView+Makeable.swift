//
//  UIStackView+Makeable.swift
//  ViewComposer1
//
//  Created by Alexander Cyon on 2018-04-25.
//  Copyright © 2018 cyon. All rights reserved.
//

import UIKit

extension UIStackView: Composable {
    public typealias SelfMakeable = UIStackView
    public typealias Style = StackViewStyle
}
