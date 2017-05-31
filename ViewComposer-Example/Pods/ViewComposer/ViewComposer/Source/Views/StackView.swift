//
//  StackView.swift
//  Breeze
//
//  Created by Alexander Cyon on 2017-05-05.
//  Copyright © 2017 Nordic Choice Hotels. All rights reserved.
//

import Foundation

final class StackView: UIStackView {
    let style: ViewStyle
    fileprivate var backgroundColorView: View?
    
    init(_ style: ViewStyle? = nil) {
        let style = style.union(.default)
        self.style = style
        super.init(frame: .zero)
        setup(with: style)
    }
    
    required init(coder: NSCoder) { requiredInit() }
}

//MARK: - ViewStyleable
extension StackView: ViewStyleable {
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
        backgroundColorView.snp.makeConstraints { make in
            make.center.equalTo(self)
            make.size.equalTo(self)
        }
        self.backgroundColorView = backgroundColorView
    }
}
private extension ViewStyle {
    @nonobjc static let `default`: ViewStyle = [.axis(.vertical)]
}
