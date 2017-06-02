[![Version](https://img.shields.io/cocoapods/v/Sourcery.svg?style=flat)](http://cocoapods.org/pods/ViewComposer)
[![License](https://img.shields.io/cocoapods/l/Sourcery.svg?style=flat)](http://cocoapods.org/pods/ViewComposer)
[![Platform](https://img.shields.io/cocoapods/p/Sourcery.svg?style=flat)](http://cocoapods.org/pods/ViewComposer)


## ViewComposer

### Style views using enums swiftly

Style views using an enum array with its attributes:
```swift
let label: UILabel = .make([.text("Hello World"), .textColor(.red)])
```

Or use the subclass `Label`, to declare the view using array literals:
```swift
let label: Label = [.text("Hello World"), .textColor(.red)]
```

The strength of style views like this get especially clear when you look at a `UIViewController` example, and this isn't even a complicated ViewController.

```swift
class ViewController: UIViewController {
    private lazy var redButton = UIButton.make([.backgroundColor(.red), .text("Red"), .textColor(.blue)])
    private lazy var blueButton: UIButton = .make([.backgroundColor(.blue), .states([.normal("Blue", nil)]), .textColor(.red)])
    private lazy var buttons: UIStackView = .make([.arrangedSubviews([self.redButton, self.blueButton]), .distribution(.fillEqually)])
    
    private lazy var yellowButton: UIButton = .make([.backgroundColor(.yellow), .text("Yellow"), .textColor(.red)])
    private lazy var label: UILabel = .make([.text("Hey ViewComposer user"), .textAlignment(.center)])
    
    private lazy var stackView: UIStackView = .make([.arrangedSubviews([self.buttons, self.yellowButton, self.label]), .axis(.vertical), .distribution(.fillEqually)])
}
```

Compared to vanilla:

```swift
class ViewControllerVanilla: UIViewController {
    
    private lazy var redButton: UIButton = {
        let redButton = UIButton()
        redButton.backgroundColor = .red
        redButton.setTitle("Red", for: .normal)
        redButton.setTitleColor(.blue, for: .normal)
        return redButton
    }()
    
    private lazy var blueButton: UIButton = {
        let redButton = UIButton()
        redButton.backgroundColor = .blue
        redButton.setTitle("Blue", for: .normal)
        redButton.setTitleColor(.red, for: .normal)
        return redButton
    }()
    
    private lazy var buttons: UIStackView = {
        let buttons = UIStackView(arrangedSubviews: [self.redButton, self.blueButton])
        buttons.distribution = .fillEqually
        return buttons
    }()
    
    private lazy var yellowButton: UIButton = {
        let yellowButton = UIButton()
        yellowButton.backgroundColor = .yellow
        yellowButton.setTitle("Yellow", for: .normal)
        yellowButton.setTitleColor(.red, for: .normal)
        return yellowButton
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Hey ViewComposer user"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let buttons = UIStackView(arrangedSubviews: [self.buttons, self.yellowButton, self.label])
        buttons.distribution = .fillEqually
        buttons.axis = .vertical
        return buttons
    }()
}
```
## Composables and predefined styles

Apart from using your standard `UIKit` views such as `UIButton`, `UILabel`, `UIStackView` directly, without having to subclass, by using the static function `make([attr1, attr2...])` you can compose views using the subclasses `Button`, `Label`, `StackView`. This is what we saw earlier:

```swift
let label: Label = [.text("Hello World"), .textColor(.red)]
```

These view subclasses are conforming to the protocol `Composable`. The `Composable` types offers initialization using ExpressibleByArrayLiteral. This makes it possible to declare the array of `ViewAttribute`s without calling any function. But this is just syntacical sugar. 

You can also declare some standard style, e.g. font, textcolor, text alignment and upper/case strings that you wanna use for all of your `UILabel`s. The style is stored in a type called `ViewStyle`. These are mergeable. Which makes it conveinent to share style between labels and merge custom values into the shared style and creating the label from this merged style.

```swift
let labelStyle: ViewStyle = [.textColor(.red), .textAlignment(.center)]
let fooLabel = Label(labelStyle.merge(master: .text("Foo")))
```


In the call to function `merge` above, you can see the *argument label* `master:`, which indicates that if the `ViewAttribute` *text* would already exist in the `ViewStyle` *labelStyle*, then it would be overridden by with the value *"Foo"* (thus acting as *master* (as opposed to *slave*)). 

The real strength of using `Composable` types is that you can base init on a style and merge it resulting in a view.

Take another look at the same example as above, but here making use of the `merge(master:`  operator `<<-`:

```swift
let labelStyle: ViewStyle = [.textColor(.red), .textAlignment(.center)]
let fooLabel: Label = labelStyle <<- .text("Foo")
```

Let's look at a ViewController example, making use of `Composable`s and the strength of a default style and the `<<-` operator

```swift
class LabelsViewControllerVanilla: UIViewController {
    
    private lazy var fooLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Foo"
        label.textColor = .red
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    private lazy var barLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bar"
        label.backgroundColor = .red
        label.textColor = .blue
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    private lazy var bazLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Baz"
        label.backgroundColor = .green
        label.textColor = .red
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 45)
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let buttons = UIStackView(arrangedSubviews: [self.fooLabel, self.barLabel, self.bazLabel])
        buttons.distribution = .fillEqually
        buttons.axis = .vertical
        return buttons
    }()
}
```


But using `Composable`:

```swift
private let labelStyle: ViewStyle = [.textColor(.red), .textAlignment(.center), .font(.boldSystemFont(ofSize: 30))]
class LabelsViewController: UIViewController {
    
    private lazy var fooLabel: Label = labelStyle <<- .text("Foo")
    private lazy var barLabel: Label = labelStyle <<- [.text("Bar"), .textColor(.blue), .backgroundColor(.red)]
    private lazy var bazLabel: Label = labelStyle <<- [.text("Baz"), .textAlignment(.left), .backgroundColor(.green), .font(.boldSystemFont(ofSize: 45))]
    
    lazy var stackView: UIStackView = .make([.arrangedSubviews([self.fooLabel, self.barLabel, self.bazLabel]), .axis(.vertical), .distribution(.fillEqually)])
}
```









