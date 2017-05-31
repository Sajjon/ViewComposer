//
//  StackView.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-31.
//
//

import Foundation

final class StackView: UIStackView {
    let style: ViewStyle
    fileprivate var backgroundColorView: UIView?
    
    init(_ style: ViewStyle? = nil) {
        let style = style.merge(slave: .default)
        self.style = style
        super.init(frame: .zero)
        setup(with: style)
    }
    
    required init(coder: NSCoder) { requiredInit() }
}

//MARK: - ViewStyleable
extension StackView: Styleable {
    func customSetup(with style: ViewStyle) {
        setupArrangedSubviews(with: style)
        setupBackgroundView(with: style)
    }
}

private extension StackView {
    func setupArrangedSubviews(with style: ViewStyle) {
        guard let views: [UIView] = style.value(.arrangedSubviews) else { return }
        views.forEach { addArrangedSubview($0) }
    }
    
    func setupBackgroundView(with style: ViewStyle) {
        if let backgroundColor: UIColor = style.value(.backgroundColor) {
            setupBackgroundView(with: backgroundColor)
        }
    }
    
    func setupBackgroundView(with color: UIColor) {
        let backgroundColorView = View([.backgroundColor(color)])
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
