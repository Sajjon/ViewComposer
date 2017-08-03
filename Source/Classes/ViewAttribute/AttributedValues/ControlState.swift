//
//  ControlState.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-05-31.
//
//

import UIKit

public class ControlState {
    public var state: UIControlState { fatalError("Override me") }
    
    public var title: String?
    public var titleColor: UIColor?
    public var image: UIImage?
    public var borderColor: UIColor?
    
    public init(title: String? = nil, titleColor: UIColor? = nil, image: UIImage? = nil, colorOfBorder borderColor: UIColor? = nil) {
        self.title = title
        self.titleColor = titleColor
        self.image = image
        self.borderColor = borderColor
    }
}

extension ControlState {
    
    public convenience init() {
        self.init(borderColor: nil)
    }
    
    public convenience init(_ title: String? = nil, _ titleColor: UIColor? = nil, _ image: UIImage? = nil, borderColor: UIColor? = nil) {
        self.init(title: title, titleColor: titleColor, image: image, colorOfBorder: borderColor)
    }
    
    public convenience init(_ title: String?, _ image: UIImage?) {
        self.init(title: title, titleColor: nil, image: image, colorOfBorder: nil)
    }
    
    public convenience init(_ titleColor: UIColor?) {
        self.init(title: nil, titleColor: titleColor, image: nil, colorOfBorder: nil)
    }
}

public class Normal: ControlState {
    public override var state: UIControlState { return .normal }
}

public class Highlighted: ControlState {
    public override var state: UIControlState { return .highlighted }
}

public class Disabled: ControlState {
    public override var state: UIControlState { return .disabled }
}

public class Selected: ControlState {
    public override var state: UIControlState { return .selected }
}

public class Focused: ControlState {
    public override var state: UIControlState { return .focused }
}

public class Application: ControlState {
    public override var state: UIControlState { return .application }
}

public class Reserved: ControlState {
    public override var state: UIControlState { return .reserved }
}


extension ControlState: MergeableAttribute {
    public func merge(overwrittenBy other: ControlState) -> Self {
        guard state == other.state else { fatalError("Not same UIControlState") }
        let merged = self
        merged.title = other.title ?? self.title
        merged.titleColor = other.titleColor ?? self.titleColor
        merged.image = other.image ?? self.image
        merged.borderColor = other.borderColor ?? self.borderColor
        return merged
    }
}

extension UIControlState: Hashable {
    public var hashValue: Int { return rawValue.hashValue }
}

extension ControlState: Equatable {
    public static func == (lhs: ControlState, rhs: ControlState) -> Bool { return lhs.state == rhs.state }
}

extension ControlState: Hashable {
    public var hashValue: Int { return state.hashValue }
}

extension Array where Element == ControlState {
    public func merge(overwrittenBy other: [ControlState]) -> [ControlState] {
        
        let concatenated: [ControlState] = self + other
        
        let allTypes: [UIControlState] = concatenated.map { $0.state }
        let duplicateOfDuplicates = allTypes.filter { (type: UIControlState) in allTypes.filter { $0 == type }.count > 1 }
        //swiftlint:disable:next syntactic_sugar
        let duplicateTypes = Array<UIControlState>(Set<UIControlState>(duplicateOfDuplicates))
        
        var merged = [ControlState]()
        
        for duplicateType in duplicateTypes {
            let duplicateStates = concatenated.filter { $0.state == duplicateType }
            var duplicateState = duplicateStates[0]
            duplicateStates.forEach { duplicateState = duplicateState.merge(overwrittenBy: $0) }
            merged.append(duplicateState)
        }
        
        var set = Set<ControlState>(merged)
        concatenated.forEach { set.insert($0) }
        return Array(set)
    }
}

public struct ControlStateMerger: MergeInterceptor {
    public static func interceptMerge<A>(master masterAttributed: A, slave: A) -> A where A : Attributed {
        guard
            let master = masterAttributed as? ViewStyle,
            let slave = slave as? ViewStyle,
            let masterControlStates: [ControlState] = master.value(.states),
            let slaveControlStates: [ControlState] = slave.value(.states)
            else { return masterAttributed }
        let merged = slaveControlStates.merge(overwrittenBy: masterControlStates)
        //swiftlint:disable:next force_cast
        return ViewStyle([.states(merged)]) as! A
    }
}

