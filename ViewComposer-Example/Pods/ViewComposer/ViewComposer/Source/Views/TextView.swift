//
//  TextView.swift
//  Breeze
//
//  Created by Alexander Cyon on 2017-04-19.
//  Copyright © 2017 Nordic Choice Hotels. All rights reserved.
//

import UIKit

final class TextView: UITextView {
    
    fileprivate let style: ViewStyle
    
    init(_ text: String? = nil, delegate: UITextViewDelegate? = nil, style: ViewStyle = .default) {
        self.style = style
        super.init(frame: .zero, textContainer: nil)
        self.delegate = delegate
        self.text = text
        setup(with: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(neededByCompiler)
    }
}

extension TextView {
    convenience init(_ text: String? = nil, delegate: UITextViewDelegate? = nil, _ look: [ViewAttribute]) {
        self.init(text, delegate: delegate, style: ViewStyle(look))
    }
    
    convenience init(_ text: L10n, delegate: UITextViewDelegate? = nil, _ look: [ViewAttribute]) {
        self.init(text.string, delegate: delegate, style: ViewStyle(look))
    }
}

private extension TextView {
    func setup(with style: ViewStyle) {
        translatesAutoresizingMaskIntoConstraints = false
        style.apply(to: self)
    }
}

private extension ViewStyle {
    @nonobjc static let `default`: ViewStyle = .empty
}

