[![Version](https://img.shields.io/cocoapods/v/ViewComposer.svg?style=flat)](http://cocoapods.org/pods/ViewComposer)
[![License](https://img.shields.io/cocoapods/l/ViewComposer.svg?style=flat)](http://cocoapods.org/pods/ViewComposer)
[![Platform](https://img.shields.io/cocoapods/p/ViewComposer.svg?style=flat)](http://cocoapods.org/pods/ViewComposer)


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

## Mergeable

The attributes enum array `[ViewAttribute]` creates a `ViewStyle` (wrapper that can create views). 

An array `[ViewAttribute]` can be merged with another array or a single attribute. Such an array can also be merged with a `ViewStyle`. A `ViewStyle` can be merged with a single `ViewAttribute` as well. An array of attributes can also be merged with a single attribute. Any type can be on the left handside or right handside in the merge. 

The result of the merge is always a `ViewStyle`, since this is the most refined type.

There are two different merge functions, `merge:master` and `merge:slave`, since the two types you are merging may contain the same attribute, i.e. there is a duplicate, you need to decide which value to keep.

### Examples
Merge between `[ViewAttribute]` arrays with a duplicate value using `merge:slave` and `merge:master`
```swift
    let foo: [ViewAttribute] = [.text("foo")]
    let bar: [ViewAttribute] = [.text("bar"), .backgroundColor(.red)]

    // The merged results are of type `ViewStyle`
    let fooMerged = foo.merge(slave: bar) // [.text("foo"), backgroundColor(.red)]
    let barMerged = foo.merge(master: bar) // [.text("bar"), backgroundColor(.red)]
```

As mentioned above, you can merge single attributes as well

```swift
    let foo: ViewAttribute = .text("foo") 
    let style: ViewStyle = [.text("bar"), .backgroundColor(.red)]

    // The merged results are of type `ViewStyle`
    let mergeSingleAttribute = style.merge(master: foo) // [.text("foo"), backgroundColor(.red)]

    let array: [ViewAttriubte] = [.text("foo")]
    let mergeArray = style.merge(master: foo) // [.text("foo"), backgroundColor(.red)]
```

### Merge operators `<-` and `<<-`

Instead of writing `foo.merge(slave: bar)` we can write `foo <- bar` and instead of writing `foo.merge(master: bar` we can write `foo <<- bar`.

```swift
    let foo: [ViewAttribute] = [.text("foo")]
    let bar: [ViewAttribute] = [.text("bar"), .backgroundColor(.red)]

    // The merged results are of type `ViewStyle`
    let fooMerged = foo <- bar // [.text("foo"), backgroundColor(.red)]
    let barMerged = foo <<- bar // [.text("bar"), backgroundColor(.red)]
```

Of course the operator `<-` and `<<-` works between `ViewStyle`s, `ViewAttribute` and `[ViewAttriubte]` interchangably.

## Composables and predefined styles

You can compose views using the subclasses `Button`, `Label`, `StackView`, as we saw earlier:

```swift
let label: Label = [.text("Hello World"), .textColor(.red)]
```

These view subclasses are conforming to the protocol `Composable`. The `Composable` types offers initialization using array literals, since they conform to the protocol `ExpressibleByArrayLiteral`. 

This makes it possible to declare the array of `ViewAttribute`s without calling any function.

You can also declare some standard style, e.g. font, textcolor, text alignment and upper/case strings that you wanna use for all of your `UILabel`s. Since `ViewStyle` are **mergeable** it makes it convenient to share style between labels and merge custom values into the shared style and creating the label from this merged style.

```swift
let labelStyle: ViewStyle = [.textColor(.red), .textAlignment(.center)]
let fooLabel = Label(labelStyle.merge(master: .text("Foo")))
```

The real strength of using `Composable` types is that they can be created from a merge **inline**.

Take another look at the same example as above, but here making use of the `merge(master:`  operator `<<-`:

```swift
let labelStyle: ViewStyle = [.textColor(.red), .textAlignment(.center)]
let fooLabel: Label = labelStyle <<- .text("Foo")
```

Here the operator `<<-` actually creates a `Label` direcly, instead of having to first create a `ViewStyle`. 

Let's look at a ViewController example, making use of `Composable`s and the strength of a default style and the `<<-` operator:

```swift
private let labelStyle: ViewStyle = [.textColor(.red), .textAlignment(.center), .font(.boldSystemFont(ofSize: 30))]
class LabelsViewController: UIViewController {
    
    private lazy var fooLabel: Label = labelStyle <<- .text("Foo")
    private lazy var barLabel: Label = labelStyle <<- [.text("Bar"), .textColor(.blue), .backgroundColor(.red)]
    private lazy var bazLabel: Label = labelStyle <<- [.text("Baz"), .textAlignment(.left), .backgroundColor(.green), .font(.boldSystemFont(ofSize: 45))]
    
    lazy var stackView: StackView = [.arrangedSubviews([self.fooLabel, self.barLabel, self.bazLabel]), .axis(.vertical), .distribution(.fillEqually)]
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


## ViewAttribute
Here are some of the attributes (this list gets updated manually...), take a look at the [full list here](https://github.com/Sajjon/ViewComposer/blob/master/Source/Classes/ViewAttribute/ViewAttribute.swift)

```swift
public enum ViewAttribute {
    case custom(BaseAttributed)
    
    // View
    case isHidden(Bool)
    case backgroundColor(UIColor)
    case cornerRadius(CGFloat) /* might be overridden by: */; case radius(Radius)
    case verticalHugging(LayoutPriority)
    case verticalCompression(LayoutPriority)
    case horizontalHugging(LayoutPriority)
    case horizontalCompression(LayoutPriority)
    case contentMode(UIViewContentMode)
    case height(CGFloat)
    case width(CGFloat)
    
    // TextHolder
    case text(String)
    case font(UIFont)
    case textColor(UIColor)
    case `case`(Case)
    case textAlignment(NSTextAlignment)
    
    // PlaceholderOwner
    case placeholder(String)
    
    // ImageHolder
    case image(UIImage)
    
    // UIScrollView
    case isScrollEnabled(Bool)
    
    // ControlState
    case states([ControlState])
    
    // UIControl
    case target(Actor)
    
    // UIStackView
    case axis(UILayoutConstraintAxis)
    case distribution(UIStackViewDistribution)
    case alignment(UIStackViewAlignment)
    case spacing(CGFloat)
    case margin(CGFloat)
    case arrangedSubviews([UIView])
}
```

## CAUTION: Avoid arrays with duplicate values.
As of now it is possible to create an attributes array with duplicate values, e.g.

```swift
    // NEVER DO THIS!
    let foobar: [ViewAttribute] = [.text("bar"), .text("foo")]
```

It is possible to have an array of attributes containing duplicate values. But using it to instantiate a view, e.g. a `UILabel` will infact ignore the duplicate value.

```swift
    let foobar: [ViewAttribute] = [.text("foo"), .text("bar")] //contains both, since array may contain duplicates
    let label: UILabel = .make(foobar) // func `make` calls `let style = attributes.merge(slave: [])` removing duplicates.
    print(label.text!) // prints "foo", since duplicate value `.text("bar")` has been removed by call to `make`
```

Thus it is **strongly** disencouraged to instantiate arrays with duplicate values. But the scenarios where you are merging types with duplicates is handled, since you chose which attribute you wanna keep using either `merge:master` or `merge:slave`.

## Custom attribute

One of the attributes is called `custom` taking a `BaseAttributed` type. This is practical if you want to create a view taking some custom attributes.

In the [example app](https://github.com/Sajjon/ViewComposer/tree/master/Example) you will find two cases of using the `custom` attribute, one simple and one advanced. 

### Creating a simple custom attribute

Let's say that you create the custom attribute `FooAttribute`:

#### Step 1: Create attribute enum

```swift
enum FooAttribute {
    case foo(String)
}
```

#### Step 2 (optional): Protocol for types using custom attribute

Let us then create a shared protocol for all types that what to by styled using the `FooAttribute`, let's call this protocol `FooProtocol`:

```swift
protocol FooProtocol {
    var foo: String? { get set }
}
```

#### Step 3 (final): Create style holding list of custom attributes
In this example we only declared one attribute (`case`) inside `FooAttribute` but you can of course have multiple. The list of these should be contained in a type conforming to `BaseAttributed`, which requires the `func install(on styleable: Any)`. In this function we style the type with the attributes. Now it becomes clear that it is convenient to not skip **step 2**, and use a protocol bridging all types that can use `FooAttribute` together.

```swift

struct FooStyle: BaseAttributed {
    let attributes: [FooAttribute]

    init(_ attributes: [FooAttribute]) {
        self.attributes = attributes
    }

    func install(on styleable: Any) {
        guard var foobar = styleable as? FooProtocol else { return }
        attributes.forEach {
            switch $0 {
            case .foo(let foo):
                foobar.foo = foo
            }
        }
    }
}
```

#### Usage of `FooAttribute`

We can now create some simple view conforming to `FooProtocol` that we can style using the custom `FooAttribute`. This might be a weird example, since why not just subclass `UILabel` directly? But that would make the code too short and simple, since `UILabel` already conforms to `Styleable`. So it would be misleading and cheating. That is why have this example, since `UIView` does not conform to `Styleable`.

```swift
final class FooLabel: UIView, FooProtocol {
    typealias Style = ViewStyle
    var foo: String? { didSet { label.text = foo } } //
    let label: Label
    
    init(_ style: ViewStyle? = nil) {
        let style = style.merge(slave: [.textAlignment(.center)])//default attributes
        label = Label(style)
        super.init(frame: .zero)
        compose(with: style) // setting up this view and calls `setupSubviews` below
    }
}

extension FooLabel: Composable {
    func setupSubviews(with style: ViewStyle) {
        addSubview(label) // and add constraints...
    }
}
```

Now we can create and style `FooLabel` with our "standard" `ViewAttribute`s but also pass along `FooAttribute` using `custom`, like this:

```swift
let fooLabel: FooLabel = [.custom(FooStyle([.foo("Foobar")])), .textColor(.red), .backgroundColor(.cyan)]
```

Here we create the `FooLabel` and styling it with our custom `FooStyle` (container for `FooAttribute`) while also styling it with `textColor` and `backgroundColor`. This way you can combine custom attributes with "standard" ones. 

Whole code can be found [here in the example app](https://github.com/Sajjon/ViewComposer/blob/master/Example/Source/Views/FooLabel.swift)

**Please note that you cannot merging of custom attributes does not happen automatically**. See next section.

### Merging custom attributes

Check out [TriangleView.swift](https://github.com/Sajjon/ViewComposer/blob/master/Example/Source/Views/TriangleView.swift) for example of advanced usage of custom attributes.
