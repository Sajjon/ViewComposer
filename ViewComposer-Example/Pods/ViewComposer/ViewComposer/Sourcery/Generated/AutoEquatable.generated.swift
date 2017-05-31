// Generated using Sourcery 0.6.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable file_length
fileprivate func compareOptionals<T>(lhs: T?, rhs: T?, compare: (_ lhs: T, _ rhs: T) -> Bool) -> Bool {
	switch (lhs, rhs) {
		case let (lValue?, rValue?):
			return compare(lValue, rValue)
		case (nil, nil):
			return true
		default:
			return false
	}
}

fileprivate func compareArrays<T>(lhs: [T], rhs: [T], compare: (_ lhs: T, _ rhs: T) -> Bool) -> Bool {
	guard lhs.count == rhs.count else { return false }
	for (idx, lhsItem) in lhs.enumerated() {
		guard compare(lhsItem, rhs[idx]) else { return false }
	}
	return true
}





	// MARK: - Actor AutoEquatable
	extension Actor: Equatable {} 
		internal func == (lhs: Actor, rhs: Actor) -> Bool {
	guard lhs.target == rhs.target else { return false }
	guard lhs.selector == rhs.selector else { return false }
	guard lhs.event == rhs.event else { return false }
		return true
	}
	// MARK: - State AutoEquatable
	extension State: Equatable {} 
		internal func == (lhs: State, rhs: State) -> Bool {
	guard lhs.title == rhs.title else { return false }
	guard compareOptionals(lhs: lhs.image, rhs: rhs.image, compare: ==) else { return false }
		return true
	}

	// MARK: - UIControlEvents AutoEquatablePublic
	extension UIControlEvents: Equatable {} 
		public func == (lhs: UIControlEvents, rhs: UIControlEvents) -> Bool {
		return true
	}

	// MARK: - ControlState AutoEquatable
	extension ControlState: Equatable {}
	internal func == (lhs: ControlState, rhs: ControlState) -> Bool {
		switch (lhs, rhs) {
					case (.normal(let leftAssociated), .normal(let rightAssociated)):
							return leftAssociated == rightAssociated
					case (.highlighted(let leftAssociated), .highlighted(let rightAssociated)):
							return leftAssociated == rightAssociated
					case (.disabled(let leftAssociated), .disabled(let rightAssociated)):
							return leftAssociated == rightAssociated
			default: return false 
		}
	}
	// MARK: - Radius AutoEquatable
	extension Radius: Equatable {}
	internal func == (lhs: Radius, rhs: Radius) -> Bool {
		switch (lhs, rhs) {
					case (.rounded, .rounded):
						return true
		}
	}


