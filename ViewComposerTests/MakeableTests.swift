//
//  ViewComposerTests.swift
//  ViewComposerTests
//
//  Created by Alexander Cyon on 2017-05-30.
//
//

import XCTest
@testable import ViewComposer

class ViewComposerTests: XCTestCase {
    
    let text: String = "foobar"
    let isHidden = true
    let color: UIColor = .red
    let cornerRadius: CGFloat = 3.1415
    
    func style(includeColor: Bool = true) -> ViewStyle {
        var attributes: [ViewAttribute] = [.isHidden(isHidden), .cornerRadius(cornerRadius), .text(text)]
        
        if includeColor {
            attributes.append(.backgroundColor(color))
        }
        return ViewStyle(attributes)
    }
    
    func validateThatTypeIsMakeable<M: UIView>(_ type: M.Type) where M: Makeable, M.Style == ViewStyle {
        let isStackView = type == UIStackView.self
        let makeable = M.make(style(includeColor: !isStackView)) as! M
        
        if !isStackView {
            assertIs(makeable.backgroundColor, is: color)
        }
        
        assertIs(makeable.isHidden, is: isHidden)
        assertIs(makeable.layer.cornerRadius, is: cornerRadius)
    }
    
    func testMakeableLabel() {
        validateThatTypeIsMakeable(UILabel.self)
    }
    
    func testMakeableButton() {
        validateThatTypeIsMakeable(UIButton.self)
    }
    
    func testMakeableStackView() {
        validateThatTypeIsMakeable(UIStackView.self)
    }
    
    func testLabel() {
        let label = UILabel.make(style())
        assertIs(label.layer.cornerRadius, is: cornerRadius)
        assertIs(label.isHidden, is: isHidden)
        assertIs(label.backgroundColor, is: color)
        assertIs(label.text, is: text)
    }
    
    let spacing: CGFloat = 42
    let arrangedSubviews: [UIView] = [UILabel(), UIView(), UIButton()]
    func testStackView() {
        
        let attributes: [ViewAttribute] = [.spacing(spacing), .arrangedSubviews(arrangedSubviews)]
        let stackView = UIStackView.make(style().merge(master: attributes))
        assertIs(stackView.layer.cornerRadius, is: cornerRadius)
        assertIs(stackView.isHidden, is: isHidden)
        assertIs(stackView.arrangedSubviews.count, is: arrangedSubviews.count)
    }
    
    func testComposableStackView() {
        let stackView: StackView = style() <<- [.spacing(spacing), .arrangedSubviews(arrangedSubviews)]
        assertIs(stackView.arrangedSubviews.count, is: arrangedSubviews.count)
        assertIs(stackView.backgroundColorView?.backgroundColor, is: color)
    }
    
    func testComposableLabel() {
        let hiddenLabel = Label(style())
        assertIs(hiddenLabel.isHidden, is: true)
        let label: Label = style() <<- [.isHidden(false)]
        assertIs(label.isHidden, is: false)
    }
    
}
