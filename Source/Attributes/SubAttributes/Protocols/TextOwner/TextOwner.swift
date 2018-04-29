//
//  TextOwner.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2018-04-27.
//

import Foundation

public protocol TextOwner: BaseAttributeProtocol {}

/// Used for declaring shared textOwner attributes
public class TextAttribute: BaseAttribute, TextOwner {}
