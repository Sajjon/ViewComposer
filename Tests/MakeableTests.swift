//
//  MakeableTests.swift
//  ViewComposerTests
//
//  Created by Alexander Cyon on 2017-05-30.
//
//

import XCTest
@testable import ViewComposer

class MakeableTests: XCTestCase {
    
    func makeStyle(includeColor: Bool = true) -> ViewStyle {
        var attributes: [ViewAttribute] = [.hidden(isHidden), .cornerRadius(cornerRadius), .text(text)]
        
        if includeColor {
            attributes.append(.backgroundColor(color))
        }
        return ViewStyle(attributes)
    }
    
    var style: ViewStyle { return makeStyle() }
    
    func validateThatTypeIsMakeable<M: UIView>(_ type: M.Type) where M: Makeable, M.Style == ViewStyle {
        let isStackView = type == UIStackView.self
        let makeable = M.make(makeStyle(includeColor: !isStackView)) as! M
        
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
        let label = UILabel.make(style)
        assertIs(label.layer.cornerRadius, is: cornerRadius)
        assertIs(label.isHidden, is: isHidden)
        assertIs(label.backgroundColor, is: color)
        assertIs(label.text, is: text)
    }
    
    func testStackView() {
        let s1 = UIStackView.make(style.merge(master: .arrangedSubviews(arrangedSubviews)))
        let s2: UIStackView = .make(style.merge(master: .arrangedSubviews(arrangedSubviews)))
        let s3: UIStackView = make(style.merge(master: .arrangedSubviews(arrangedSubviews)))
        let s4: UIStackView = style <<- .arrangedSubviews(arrangedSubviews)
        let stackViews = [s1, s2, s3, s4]
        for stackView in stackViews {
            assertIs(stackView.layer.cornerRadius, is: cornerRadius)
            assertIs(stackView.isHidden, is: isHidden)
            assertIs(stackView.arrangedSubviews.count, is: arrangedSubviews.count)
        }
    }
    
    func testButton() {
        let buttonImage = UIImage()
        let button1: UIButton = [.states([Normal(text), Highlighted("hi", buttonImage)]), .backgroundColor(color)]
        assertIs(button1.title(for: .normal), is: text)
        assertIs(button1.backgroundColor, is: color)
        assertIs(button1.title(for: .highlighted), is: "hi")
        assertIs(button1.image(for: .highlighted), is: buttonImage)
        
        let button2: UIButton = [.text(text), .backgroundColor(color)]
        assertIs(button2.title(for: .normal), is: text)
        assertIs(button2.backgroundColor, is: color)
    }
    
    func testStackViewUsingMergeGeneric() {
        let s1: UIStackView = style.merge(master: [.spacing(spacing), .arrangedSubviews(arrangedSubviews)])
        let s2: UIStackView = style.merge(slave: [.spacing(spacing), .arrangedSubviews(arrangedSubviews)])
        let s3: UIStackView = style.merge(master: ViewStyle([.spacing(spacing), .arrangedSubviews(arrangedSubviews)]))
        let s4: UIStackView = style.merge(slave: ViewStyle([.spacing(spacing), .arrangedSubviews(arrangedSubviews)]))
        let s5: UIStackView = style.merge(master: .arrangedSubviews(arrangedSubviews))
        let s6: UIStackView = style.merge(slave: .arrangedSubviews(arrangedSubviews))
        let stackViews = [s1, s2, s3, s4, s5, s6]
        for stackView in stackViews {
            assertIs(stackView.layer.cornerRadius, is: cornerRadius)
            assertIs(stackView.isHidden, is: isHidden)
            assertIs(stackView.arrangedSubviews.count, is: arrangedSubviews.count)
        }
    }
    
    func testComposableStackViewUsingMerge() {
        let stackView = StackView(style.merge(master: [.spacing(spacing), .arrangedSubviews(arrangedSubviews)]))
        assertIs(stackView.arrangedSubviews.count, is: arrangedSubviews.count)
        assertIs(stackView.backgroundColorView?.backgroundColor, is: color)
    }
    
    
    func testComposableStackViewUsingMergeOperator() {
        let stackView: StackView = style <<- [.spacing(spacing), .arrangedSubviews(arrangedSubviews)]
        assertIs(stackView.arrangedSubviews.count, is: arrangedSubviews.count)
        assertIs(stackView.backgroundColorView?.backgroundColor, is: color)
    }
    
    func testComposableLabel() {
        let hiddenLabel = Label(style)
        assertIs(hiddenLabel.isHidden, is: true)
        let label: Label = style <<- [.hidden(false)]
        assertIs(label.isHidden, is: false)
    }
    
//    func testComposableButton() {
//        let buttonTitleNormal = "press me"
//        let buttonImageNormal = UIImage()
//        let states: [ControlState] = [.normal(buttonTitleNormal, buttonImageNormal)]
//        let button: UIButton = style().merge(master: [.states(states)])
//        assertIs(button.title(for: .normal), is: buttonTitleNormal)
//        assertIs(button.image(for: .normal), is: buttonImageNormal)
//        
//        let button2: Button = [.text(text)]
//        assertIs(button2.title(for: .normal), is: text)
//    }
    
}
