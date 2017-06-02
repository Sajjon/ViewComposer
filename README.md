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

We are styling our views using an array of the enum type `ViewAttribute` which creates a type called `ViewStyle` which can be used to style our views. **Please note that the order of the attributes (enums) does not matter**:

```swift
let label: UILabel = .make([.text("Hello World"), .textColor(.red)])
let label2: UILabel = .make([.textColor(.red), .text("Hello World")]) // identical to `label2` ORDER DOES NOT MATTER.
```

Even though it might be a good idea to use the same order in your app for consistency.

The strength of styling views like this get especially clear when you look at a `UIViewController` example, and this isn't even a complicated ViewController.

```swift
class NestedStackViewsViewController: UIViewController {

    private lazy var redButton = UIButton.make([.backgroundColor(.red), .text("Red"), .textColor(.blue)])
    private lazy var blueButton: UIButton = .make([.backgroundColor(.blue), .states([.normal("Blue", nil)]), .textColor(.red)])
    private lazy var buttons: UIStackView = .make([.arrangedSubviews([self.redButton, self.blueButton]), .distribution(.fillEqually)])
    
    private lazy var yellowButton: UIButton = .make([.backgroundColor(.yellow), .text("Yellow"), .textColor(.red)])
    private lazy var label: UILabel = .make([.text("Hey ViewComposer user"), .textAlignment(.center)])
    
    lazy var stackView: StackView = [.arrangedSubviews([self.buttons, self.yellowButton, self.label]), .axis(.vertical), .distribution(.fillEqually)]

    ...
}
```

Compared to vanilla:

```swift
class VanillaNestedStackViewsViewController: UIViewController {

    private lazy var redButton: UIButton = {
        let redButton = UIButton()
        redButton.translatesAutoresizingMaskIntoConstraints = false
        redButton.backgroundColor = .red
        redButton.setTitle("Red", for: .normal)
        redButton.setTitleColor(.blue, for: .normal)
        return redButton
    }()
    
    private lazy var blueButton: UIButton = {
        let blueButton = UIButton()
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.backgroundColor = .blue
        blueButton.setTitle("Blue", for: .normal)
        blueButton.setTitleColor(.red, for: .normal)
        return blueButton
    }()
    
    private lazy var buttons: UIStackView = {
        let buttons = UIStackView(arrangedSubviews: [self.redButton, self.blueButton])
        buttons.translatesAutoresizingMaskIntoConstraints = false
        buttons.distribution = .fillEqually
        return buttons
    }()
    
    private lazy var yellowButton: UIButton = {
        let yellowButton = UIButton()
        yellowButton.translatesAutoresizingMaskIntoConstraints = false
        yellowButton.backgroundColor = .yellow
        yellowButton.setTitle("Yellow", for: .normal)
        yellowButton.setTitleColor(.red, for: .normal)
        return yellowButton
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hey ViewComposer user"
        label.textAlignment = .center
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.buttons, self.yellowButton, self.label])
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()

    ...
}
```

## Non-intrusive - standard UIKit views
As we saw in the ViewComposer example above:
```swift
    private lazy var redButton = UIButton.make([.backgroundColor(.red), .text("Red"), .textColor(.blue)])
```

We are using standard `UIKit` class `UIButton`, with a static method called `make`, taking an array of `ViewAttribute` enums. This is neat if you dislike using subclasses.

An alternative to this, if you want to make use of some even more sugary syntax is to use the subclasses conforming to the type `Composable`.

## Composables and predefined styles

You can compose views using the subclasses `Button`, `Label`, `StackView`, as we saw earlier:

```swift
let label: Label = [.text("Hello World"), .textColor(.red)]
```

These view subclasses are conforming to the protocol `Composable`. The `Composable` types offers initialization using array literals, since they conform to the protocol `ExpressibleByArrayLiteral`. 

This makes it possible to declare the array of `ViewAttribute`s without calling any function.

You can also declare some standard style, e.g. font, textcolor, text alignment and upper/case strings that you wanna use for all of your `UILabel`s. The style is stored in a type called `ViewStyle`. `ViewStyle`s are are **mergeable**. Which makes it conveinent to share style between labels and merge custom values into the shared style and creating the label from this merged style.

```swift
let labelStyle: ViewStyle = [.textColor(.red), .textAlignment(.center)]
let fooLabel = Label(labelStyle.merge(master: .text("Foo")))
```


In the call to function `merge` above, you can see the *argument label* `master:`, which indicates that if the `ViewAttribute` *text* would already exist in the `ViewStyle` *labelStyle*, then it would be **overridden** by with the value *"Foo"* - thus acting as *master* (as opposed to the function `merge(slave:` which also exists). 

The real strength of using `Composable` types is that they can be created from a merge **inline**.

Take another look at the same example as above, but here making use of the `merge(master:`  operator `<<-`:

```swift
let labelStyle: ViewStyle = [.textColor(.red), .textAlignment(.center)]
let fooLabel: Label = labelStyle <<- .text("Foo")
```

Let's look at a ViewController example, making use of `Composable`s and the strength of a default style and the `<<-` operator:


```swift
private let labelStyle: ViewStyle = [.textColor(.red), .textAlignment(.center), .font(.boldSystemFont(ofSize: 30))]
class LabelsViewController: UIViewController {
    
    private lazy var fooLabel: Label = labelStyle <<- .text("Foo")
    private lazy var barLabel: Label = labelStyle <<- [.text("Bar"), .textColor(.blue), .backgroundColor(.red)]
    private lazy var bazLabel: Label = labelStyle <<- [.text("Baz"), .textAlignment(.left), .backgroundColor(.green), .font(.boldSystemFont(ofSize: 45))]
    
    lazy var stackView: StackView = .[.arrangedSubviews([self.fooLabel, self.barLabel, self.bazLabel]), .axis(.vertical), .distribution(.fillEqually)]
}
```

Compared to vanilla:

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
        let stackView = UIStackView(arrangedSubviews: [self.fooLabel, self.barLabel, self.bazLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        return stackView
    }()
}
```










