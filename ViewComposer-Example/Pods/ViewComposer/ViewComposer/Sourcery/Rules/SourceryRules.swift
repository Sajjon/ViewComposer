//
//  SourceryRules.swift
//  Breeze
//
//  Created by Alexander Cyon on 2017-05-10.
//  Copyright © 2017 Nordic Choice Hotels. All rights reserved.
//

import Foundation

protocol AutoEquatable {}
protocol AutoComparable {}
protocol AutoHashable {}

protocol AutoEquatablePublic {}
protocol AutoHashablePublic {}

protocol AutoAssociatedValueEnum {}

protocol AutoAssociatedValueStrippable {}

protocol AutoCustomStringConvertible {}

//extension L10n: AutoEquatable {}
//extension L10n: AutoHashable {}

extension State: AutoEquatable {}
extension State: AutoHashable {}

extension Actor: AutoEquatable {}
extension Actor: AutoHashable {}

extension Radius: AutoEquatable {}
extension Radius: AutoHashable {}

extension UIControlEvents: AutoEquatablePublic {}
extension UIControlEvents: AutoHashablePublic {}

extension ControlState: AutoEquatable {}
extension ControlState: AutoHashable {}

extension LayoutPriority: AutoAssociatedValueEnum {}
extension ViewAttribute: AutoAssociatedValueEnum {}

extension ViewAttribute: AutoCustomStringConvertible {}
