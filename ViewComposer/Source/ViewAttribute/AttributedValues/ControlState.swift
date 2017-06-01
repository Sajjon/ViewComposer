//
//  ControlState.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-31.
//
//

import UIKit


public typealias StateRepresentation = (String?, UIImage?)
public enum ControlState {
    case normal(String?, UIImage?)
    case highlighted(String?, UIImage?)
    case disabled(String?, UIImage?)
}

public extension ControlState {
    var state: UIControlState {
        let state: UIControlState
        switch self {
        case .normal:
            state = .normal
        case .highlighted:
            state = .highlighted
        case .disabled:
            state = .disabled
        }
        return state
    }
    
    var representation: StateRepresentation {
        switch self {
        case .normal(let representation):
            return representation
        case .highlighted(let representation):
            return representation
        case .disabled(let representation):
            return representation
        }
    }
}
