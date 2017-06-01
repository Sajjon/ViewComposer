//
//  SourceryRules.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-31.
//
//

import Foundation

protocol AutoEquatable {}
protocol AutoComparable {}
protocol AutoHashable {}

protocol AutoEquatablePublic {}
protocol AutoHashablePublic {}

protocol AutoAssociatedValueEnum {}

protocol AutoCustomStringConvertible {}

//extension L10n: AutoEquatable {}
//extension L10n: AutoHashable {}

extension Actor: AutoEquatable {}
extension Actor: AutoHashable {}

extension Radius: AutoEquatable {}
extension Radius: AutoHashable {}

extension UIControlEvents: AutoEquatablePublic {}
extension UIControlEvents: AutoHashablePublic {}

extension LayoutPriority: AutoAssociatedValueEnum {}

extension ViewAttribute: AutoAssociatedValueEnum {}
extension ViewAttribute: AutoCustomStringConvertible {}

