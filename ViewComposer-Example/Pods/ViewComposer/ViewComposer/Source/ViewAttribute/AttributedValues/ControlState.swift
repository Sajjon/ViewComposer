//
//  ControlState.swift
//  Breeze
//
//  Created by Alexander Cyon on 2017-05-29.
//  Copyright © 2017 Nordic Choice Hotels. All rights reserved.
//

import UIKit


struct State {
    let title: String
    let image: UIImage?
}

extension State {
    init(_ title: String, _ image: UIImage?) {
        self.title = title
        self.image = image
    }
}

enum ControlState {
    case normal(State)
    case highlighted(State)
    case disabled(State)
}

extension ControlState {
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
    
    var representation: State {
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
