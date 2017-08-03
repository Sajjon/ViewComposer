//
//  ProcessControlStatesTests.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-26.
//
//


import Foundation

import XCTest
@testable import ViewComposer
class ProcessControlStatesTests: BaseXCTest {

    func testProcessControlStatedNoImage() {
        let colorNormal: UIColor = .red
        let colorHighlighted: UIColor = .green
        let colorDisabled: UIColor = .gray
        let colorSelected: UIColor = .brown
        let colorFocused: UIColor = .cyan
        let colorApplication: UIColor = .purple
        let colorReserved: UIColor = .orange
        let states: [ControlState] = [
            Normal(fooText, colorNormal),
            Highlighted(colorHighlighted),
            Disabled(colorDisabled),
            Selected(colorSelected),
            Focused(colorFocused),
            Application(colorApplication),
            Reserved(colorReserved),
        ]
        let button: UIButton = [.states(states)]
        assertIs(button.title(for: .normal), is: fooText)
        assertIs(button.titleColor(for: .normal), is: colorNormal)
        
        assertIs(button.title(for: .highlighted), is: fooText)
        assertIs(button.titleColor(for: .highlighted), is: colorHighlighted)
        
        assertIs(button.title(for: .disabled), is: fooText)
        assertIs(button.titleColor(for: .disabled), is: colorDisabled)
        
        assertIs(button.title(for: .selected), is: fooText)
        assertIs(button.titleColor(for: .selected), is: colorSelected)
        
        assertIs(button.title(for: .focused), is: fooText)
        assertIs(button.titleColor(for: .focused), is: colorFocused)
        
        assertIs(button.title(for: .application), is: fooText)
        assertIs(button.titleColor(for: .application), is: colorApplication)
        
        assertIs(button.title(for: .reserved), is: fooText)
        assertIs(button.titleColor(for: .reserved), is: colorReserved)
    }
    
    func testControlStateInitializerTitleOnly() {
        let controlState = Normal(fooText)
        assertButton(with: controlState)
    }
    
    func testControlStateInitializerTitleColorOnly() {
        let controlState = Normal(.red)
        assertButton(with: controlState)
    }
    
    func testControlStateInitializerBorderColorOnly() {
        let controlState = Normal(borderColor: .red)
        assertButton(with: controlState)
    }
    
    func testControlStateInitializerTitleAndTitleColor() {
        let controlState = Normal(fooText, .red)
        assertButton(with: controlState)
    }

    func testControlStateInitializerTitleAndTitleColorAndBorderColor() {
        let controlState = Normal(fooText, .red, borderColor: .blue)
        assertButton(with: controlState)
    }
    
    func testControlStateInitializerTitleAndImage() {
        let controlState = Normal(fooText, image)
        assertButton(with: controlState)
    }

    func testControlStateInitializerTitleAndTitleColorAndImage() {
        let controlState = Normal(fooText, .red, image)
        assertButton(with: controlState)
    }
    
    func testControlStateInitializerTitleAndTitleColorAndImageAndBorderColor() {
        let controlState = Normal(fooText, .red, image, borderColor: .blue)
        assertButton(with: controlState)
    }
    
    private func assertButton(with state: ControlState) {
        let button: UIButton = [.states([state])]
        if let title = state.title {
            assertIs(button.title(for: state.state), is: title)
        }
        if let titleColor = state.titleColor {
            assertIs(button.titleColor(for: state.state), is: titleColor)
        }
        if let image = state.image {
            assertIs(button.image(for: state.state), is: image)
        }
        if let borderColor = state.borderColor, state.state == .normal {
            assertIs(button.layer.borderColor, is: borderColor.cgColor)
        }
    }
}
