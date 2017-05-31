// Generated using Sourcery 0.6.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable file_length

fileprivate func combineHashes<HashableElement: Hashable>(_ hashes: [HashableElement]) -> Int {
    let hashedArray = hashes.map { $0.hashValue }
    return hashedArray.reduce(0, combineHashValues)
}

fileprivate func combineHashValues(_ initial: Int, _ other: Int) -> Int {
    #if arch(x86_64) || arch(arm64)
        let magic: UInt = 0x9e3779b97f4a7c15
    #elseif arch(i386) || arch(arm)
        let magic: UInt = 0x9e3779b9
    #endif
    var lhs = UInt(bitPattern: initial)
    let rhs = UInt(bitPattern: other)
    lhs ^= rhs &+ magic &+ (lhs << 6) &+ (lhs >> 2)
    return Int(bitPattern: lhs)
}



// MARK: - AutoHashable for classes, protocols, structs
    // MARK: - Actor AutoHashable
    extension Actor: Hashable {
        public var hashValue: Int {
    return combineHashes([target.hashValue, selector.hashValue, event.hashValue, 0])
        }
    }
    // MARK: - State AutoHashable
    extension State: Hashable {
        public var hashValue: Int {
    return combineHashes([title.hashValue, image?.hashValue ?? 0, 0])
        }
    }

    // MARK: - UIControlEvents AutoHashable
    extension UIControlEvents: Hashable {
        public var hashValue: Int {
    return combineHashes([0])
        }
    }

// MARK: - AutoHashable for Enums

    // MARK: - ControlState AutoHashable
    extension ControlState: Hashable {
        internal var hashValue: Int {
            switch self {
                    case .normal(let data): 
                                    return 1.hashValue
                    case .highlighted(let data): 
                                    return 2.hashValue
                    case .disabled(let data): 
                                    return 3.hashValue
            }
        }
    }

    // MARK: - Radius AutoHashable
    extension Radius: Hashable {
        internal var hashValue: Int {
            switch self {
                     case .rounded: 
                            return 1.hashValue
            }
        }
    }

// MARK: -
