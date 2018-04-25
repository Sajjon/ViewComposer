//
//  Segment.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-11.
//
//

import Foundation

public enum Segment {
    case title(String)
    case image(UIImage)
}

public extension UISegmentedControl {
    
    func insertSegment(_ segment: Segment, at index: Int, animated: Bool = false) {
        switch segment {
        case .title(let title):
            insertSegment(withTitle: title, at: index, animated: animated)
        case .image(let image):
            insertSegment(with: image, at: index, animated: animated)
        }
    }
}

extension Array where Element == Segment {
    func add(to control: UISegmentedControl, animated: Bool = false) {
        for (index, segment) in enumerated() {
            control.insertSegment(segment, at: index, animated: animated)
        }
    }
}
