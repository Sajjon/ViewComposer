//
//  StackView.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-31.
//
//

import Foundation

open class StackView: UIStackView {
    open let style: ViewStyle
    open var backgroundColorView: UIView?
    
    required public init(_ style: ViewStyle? = nil) {
        let style = style.merge(slave: .default)
        self.style = style
        super.init(frame: .zero)
        compose(with: style)
    }
    
    required public init(coder: NSCoder) { requiredInit() }
}

extension StackView: Composable {
    public func setupSubviews(with style: ViewStyle) {
        setupArrangedSubviews(with: style)
        setupBackgroundView(with: style)
    }
}

public extension StackView {
    func setupBackgroundView(with style: ViewStyle) {
        if let backgroundColor: UIColor = style.value(.backgroundColor) {
            setupBackgroundView(with: backgroundColor)
        }
    }
    
    func setupBackgroundView(with color: UIColor) {
        let backgroundColorView = UIView()
        backgroundColorView.backgroundColor = color
        addSubview(backgroundColorView)
        sendSubview(toBack: backgroundColorView)
        backgroundColorView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backgroundColorView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        backgroundColorView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        backgroundColorView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.backgroundColorView = backgroundColorView
    }
}

private extension ViewStyle {
    @nonobjc static let `default`: ViewStyle = [.axis(.vertical)]
}
