//
//  Case.swift
//  Breeze
//
//  Created by Alexander Cyon on 2017-05-29.
//  Copyright © 2017 Nordic Choice Hotels. All rights reserved.
//

import Foundation

enum Case {
    case lowerCaseAll
    case upperCaseAll
    case upperCaseFirst
    case lowerCaseFirst
}

extension Case {
    func apply(to text: String?) -> String? {
        guard let text = text else { return nil }
        return translated(from: text)
    }
}

private extension Case {
    func translated(from text: String) -> String {
        switch self {
        case .lowerCaseAll:
            return text.lowercased()
        case .upperCaseAll:
            return text.uppercased()
        case .upperCaseFirst:
            return text.upperCasingFirstLetter()
        case .lowerCaseFirst:
            return text.lowerCasingFirstLetter()
        }
    }
}

extension String {
    func upperCasingFirstLetter() -> String {
        let first = String(characters.prefix(1)).capitalized
        let other = String(characters.dropFirst())
        return first + other
    }
    
    mutating func upperCaseFirstLetter() {
        self = self.upperCasingFirstLetter()
    }
    
    func lowerCasingFirstLetter() -> String {
        let first = String(characters.prefix(1)).lowercased()
        let other = String(characters.dropFirst())
        return first + other
    }
    
    mutating func lowerCaseFirstLetter() {
        self = self.lowerCasingFirstLetter()
    }
}
