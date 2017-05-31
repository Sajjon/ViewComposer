// Generated using Sourcery 0.6.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// MARK: - CustomStringConvertible for Enums
	// MARK: - ViewAttribute CustomStringConvertible
	extension ViewAttribute: CustomStringConvertible {
		var description: String {
			switch self {
						case .custom(let value):
							return "custom: \(value)" 
						case .backgroundColor(let value):
							return "backgroundColor: \(value)" 
						case .cornerRadius(let value):
							return "cornerRadius: \(value)" 
						case .radius(let value):
							return "radius: \(value)" 
						case .verticalHugging(let value):
							return "verticalHugging: \(value)" 
						case .verticalCompression(let value):
							return "verticalCompression: \(value)" 
						case .horizontalHugging(let value):
							return "horizontalHugging: \(value)" 
						case .horizontalCompression(let value):
							return "horizontalCompression: \(value)" 
						case .height(let value):
							return "height: \(value)" 
						case .width(let value):
							return "width: \(value)" 
						case .text(let value):
							return "text: \(value)" 
						case .textColor(let value):
							return "textColor: \(value)" 
						case .`case`(let value):
							return "`case`: \(value)" 
						case .textAlignment(let value):
							return "textAlignment: \(value)" 
						case .image(let value):
							return "image: \(value)" 
						case .isScrollEnabled(let value):
							return "isScrollEnabled: \(value)" 
						case .states(let value):
							return "states: \(value)" 
						case .target(let value):
							return "target: \(value)" 
						case .axis(let value):
							return "axis: \(value)" 
						case .distribution(let value):
							return "distribution: \(value)" 
						case .alignment(let value):
							return "alignment: \(value)" 
						case .spacing(let value):
							return "spacing: \(value)" 
						case .margin(let value):
							return "margin: \(value)" 
						case .arrangedSubviews(let value):
							return "arrangedSubviews: \(value)" 
			}
		}
	}
