//
//  UILabel+Makeable.swift
//  ViewComposer1
//
//  Created by Alexander Cyon on 2018-04-25.
//  Copyright © 2018 cyon. All rights reserved.
//

import UIKit

extension UILabel: Composable {
    public typealias SelfMakeable = UILabel

    public typealias Style = LabelStyle
}
