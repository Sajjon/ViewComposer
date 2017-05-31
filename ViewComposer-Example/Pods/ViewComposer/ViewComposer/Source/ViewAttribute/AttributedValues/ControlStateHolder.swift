//
//  ControlStateHolder.swift
//  Breeze
//
//  Created by Alexander Cyon on 2017-05-29.
//  Copyright © 2017 Nordic Choice Hotels. All rights reserved.
//

import Foundation

protocol ControlStateHolder {
    @discardableResult func setControlStates(_ states: [ControlState]) -> Self
}

extension UIButton: ControlStateHolder {
    @discardableResult
    @nonobjc func setControlStates(_ states: [ControlState]) -> Self {
        states.forEach {
            configureControlState(state: $0.state, with: $0.representation)
        }
        return self
    }
    
    func configureControlState(state: UIControlState, with representation: State) {
        setTitle(representation.title, for: state)
        setImage(representation.image, for: state)
    }
}
