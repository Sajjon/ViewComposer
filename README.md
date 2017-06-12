[![Platform](https://img.shields.io/cocoapods/p/ViewComposer.svg?style=flat)](http://cocoapods.org/pods/ViewComposer)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/ViewComposer.svg?style=flat)](http://cocoapods.org/pods/ViewComposer)
[![License](https://img.shields.io/cocoapods/l/ViewComposer.svg?style=flat)](http://cocoapods.org/pods/ViewComposer)


# ViewComposer

Style views using an enum array with its attributes:
```swift
let label: UILabel = [.text("Hello World"), .textColor(.red)]
```

## Table of Contents
<!-- MarkdownTOC autolink="true" bracket="round" -->

- [Installation](#installation)
- [Style views using enums swiftly](#style-views-using-enums-swiftly)
- [Non-intrusive - standard UIKit views](#non-intrusive---standard-uikit-views)
- [Mergeable](#mergeable)
    - [Examples](#examples)
    - [Merge operators `<-` and `<<-`](#merge-operators---and--)
- [Predefined styles](#predefined-styles)
    - [Passing delegates](#passing-delegates)
- [Supported attributes](#supported-attributes)
- [CAUTION: Avoid arrays with duplicate values.](#caution-avoid-arrays-with-duplicate-values)
- [Composables](#composables)
- [Custom attribute](#custom-attribute)
    - [Creating a simple custom attribute](#creating-a-simple-custom-attribute)
    - [Merging custom attributes](#merging-custom-attributes)
- [Roadmap](#roadmap)
    - [Architecture/implementation](#architectureimplementation)
    - [Supported UIKit views](#supported-uikit-views)
    - [Supported attributes](#supported-attributes-1)

<!-- /MarkdownTOC -->

## Installation

#### [CocoaPods](http://cocoapods.org) 

```ruby
pod 'ViewComposer', '~> 0.2'
```

#### [Carthage](https://github.com/Carthage/Carthage)

```ogdl
github "ViewComposer" ~> 0.2
```

#### [Swift Package Manager](https://swift.org/package-manager/) 

```swift
dependencies: [
    .Package(url: "https://github.com/Sajjon/ViewComposer.git", majorVersion: 0)
]
```

#### Manually
Refer to famous open source framwork [Alamofire's instructions on how to manually integrate a framework](https://github.com/Alamofire/Alamofire/blob/master/README.md#manually) in order to install ViewComposer in your project manually.

## Style views using enums swiftly

We are styling our views using an array of the enum type `ViewAttribute` which creates a type called `ViewStyle` which can be used to style our views. **Please note that the order of the attributes (enums) does not matter**:

```swift
let label: UILabel = [.text("Hello World"), .textColor(.red)]
let same: UILabel = [.textColor(.red), .text("Hello World")] // order does not matter
```

(*Even though it might be a good idea to use the same order in your app for consistency.*)

The strength of styling views like this get especially clear when you look at a `UIViewController` example, and this isn't even a complicated ViewController.

```swift
class NestedStackViewsViewController: UIViewController {

    lazy var fooLabel: UILabel = [.text("Foo"), .textColor(.blue), .color(.red), .textAlignment(.center)]
    lazy var barLabel: UILabel =  [.text("Bar"), .textColor(.red), .color(.green), .textAlignment(.center)]
    lazy var labels: UIStackView = [.views([self.fooLabel, self.barLabel]), .distribution(.fillEqually)]
    
    lazy var button: UIButton = [.text("Baz"), .color(.cyan), .textColor(.red)]
    
    lazy var stackView: UIStackView = [.views([self.labels, self.button]), .axis(.vertical), .distribution(.fillEqually)]
    

    ...
}
```

**Compared to vanilla:**

```swift
class VanillaNestedStackViewsViewController: UIViewController {
    
    lazy var fooLabel: UILabel = {
        let fooLabel = UILabel()
        fooLabel.translatesAutoresizingMaskIntoConstraints = false
        fooLabel.text = "Foo"
        fooLabel.textColor = .blue
        fooLabel.backgroundColor = .red
        fooLabel.textAlignment = .center
        return fooLabel
    }()
    
    lazy var barLabel: UILabel = {
        let barLabel = UILabel()
        barLabel.translatesAutoresizingMaskIntoConstraints = false
        barLabel.text = "Bar"
        barLabel.textColor = .red
        barLabel.backgroundColor = .green
        barLabel.textAlignment = .center
        return barLabel
    }()
    
    lazy var labels: UIStackView = {
        let labels = UIStackView(arrangedSubviews: [self.fooLabel, self.barLabel])
        labels.translatesAutoresizingMaskIntoConstraints = false
        labels.distribution = .fillEqually
        return labels
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .cyan
        button.setTitle("Baz", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.labels, self.button, self.button])
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
let button: UIButton = [.color(.red), .text("Red"), .textColor(.blue)]
```

**NO SUBCLASSES NEEDED 🙌**

Of course you can always change your `var` to be `lazy` (recommended) and set attributes on the view which are not yet supported by ViewComposer, like this:

```swift
lazy var button: UIButton = {
    let button: UIButton = [.color(.red), .text("Red"), .textColor(.blue)]
    // setup attributes not yet supported by ViewComposer
    button.layer.isDoubleSided = false // `isDoubleSided` is not yet supported
    return button
}()
```

## Mergeable

The attributes enum array `[ViewAttribute]` creates a `ViewStyle` (wrapper that can create views). 

An array `[ViewAttribute]` can be merged with another array or a single attribute. Such an array can also be merged with a `ViewStyle`. A `ViewStyle` can be merged with a single `ViewAttribute` as well. An array of attributes can also be merged with a single attribute. Any type can be on the left handside or right handside in the merge. 

The result of the merge is always a `ViewStyle`, since this is the most refined type.

There are two different merge functions, `merge:master` and `merge:slave`, since the two types you are merging may contain the same attribute, i.e. there is a duplicate, you need to decide which value to keep.

### Examples
Merge between `[ViewAttribute]` arrays with a duplicate value using `merge:slave` and `merge:master`
```swift
let foo: [ViewAttribute] = [.text("foo")] // can use `ViewStyle` as `bar`
let bar: ViewStyle = [.text("bar"), .color(.red)] // prefer `ViewStyle`

// The merged results are of type `ViewStyle`
let fooMerged = foo.merge(slave: bar) // [.text("foo"), .color(.red)]
let barMerged = foo.merge(master: bar) // [.text("bar"), .color(.red)]
```

As mentioned above, you can merge single attributes as well

```swift
let foo: ViewAttribute = .text("foo") 
let style: ViewStyle = [.text("bar"), .color(.red)]

// The merged results are of type `ViewStyle`
let mergeSingleAttribute = style.merge(master: foo) // [.text("foo"), .color(.red)]

let array: [ViewAttriubte] = [.text("foo")]
let mergeArray = style.merge(master: foo) // [.text("foo"), .color(.red)]
```

#### Optional styles
You can also merge optional `ViewStyle`, which is convenient for you initializers

```swift
final class MyViewDefaultingToRed: UIView {
    init(_ style: ViewStyle? = nil) {
        let style = style.merge(slave: .default)
        self.style = style
        super.init(frame: .zero)
        setup(with: style) // setup the view using the style..
    }
}
private extension ViewStyle {
    static let `default`: ViewStyle = [.color(.red)]
}
```

### Merge operators `<-` and `<<-`

Instead of writing `foo.merge(slave: bar)` we can write `foo <- bar` and instead of writing `foo.merge(master: bar` we can write `foo <<- bar`.

```swift
let foo: ViewStyle = [.text("foo")]
let bar: ViewStyle = [.text("bar"), .color(.red)]

// The merged results are of type `ViewStyle`
let fooMerged = foo <- bar // [.text("foo"), .color(.red)]
let barMerged = foo <<- bar // [.text("bar"), .color(.red)]
```

Of course the operator `<-` and `<<-` works between `ViewStyle`s, `ViewAttribute` and `[ViewAttriubte]` interchangably.

The operators also works with optional `ViewStyle`. Thus we can rewrite the merge in the initializer of `MyViewDefaultingToRed` using the `merge:slave` operator if we want to:

```swift
final class MyViewDefaultingToRed: UIView {
    init(_ style: ViewStyle? = nil) {
        let style = style <- .default
    ...
```

#### Operator Associativity when chained

Of course it is possible to chain merges. **Disregarding of left or right associativity** these three examples gets the same result:
```swift
let foo: ViewStyle = [.text("foo")]
let bar: ViewStyle = [.text("bar")]

foo <<- bar <<- .text("baz") // result: `[.text(.baz)]`
foo <- bar <- .text("baz") // result: `[.text(.foo)]`
foo <<- bar <- .text("baz") // result: `[.text(.bar)]`
```

But having a look at this example, **associativity matters!**:
```swift
let foo: ViewStyle = [.text("foo")]
let bar: ViewStyle = [.text("bar")]

// `right` associative
foo <- bar <<- .text("baz") // result: `[.text(.foo)]`

// `left` associative
foo <- bar <<- .text("baz") // result: `[.text(.baz)]`
```

`ViewComposer` is using **right** for both the `<-` as well as the `<<-` operator. This means that you should read *from right to left* when values of chained merge operators.

## Predefined styles

You can also declare some standard style, e.g. `font`, `textColor`, `textAlignment` and upper/case strings that you wanna use for all of your `UILabel`s. Since `ViewStyle` are **mergeable** it makes it convenient to share style between labels and merge custom values into the shared style and creating the label from this merged style.

```swift
let style: ViewStyle = [.textColor(.red), .textAlignment(.center)]
let fooLabel: UILabel = labelStyle.merge(master: .text("Foo")))
```

Take another look at the same example as above, but here making use of the `merge(master:`  operator `<<-`:

```swift
let labelStyle: ViewStyle = [.textColor(.red), .textAlignment(.center)]
let fooLabel: Label = labelStyle <<- .text("Foo")
```

Here the operator `<<-` actually creates a `UILabel` directly, instead of having to first create a `ViewStyle`. 

Let's look at a ViewController example, making use of the strength of predefined styles and the `<<-` operator:

```swift
private let labelStyle: ViewStyle = [.textColor(.red), .textAlignment(.center), .font(.boldSystemFont(ofSize: 30))]
class LabelsViewController: UIViewController {
    
    private lazy var fooLabel: UILabel = labelStyle <<- .text("Foo")
    private lazy var barLabel: UILabel = labelStyle <<- [.text("Bar"), .textColor(.blue), .color(.red)]
    private lazy var bazLabel: UILabel = labelStyle <<- [.text("Baz"), .textAlignment(.left), .color(.green), .font(.boldSystemFont(ofSize: 45))]
    
    lazy var stackView: UIStackView = [.views([self.fooLabel, self.barLabel, self.bazLabel]), .axis(.vertical), .distribution(.fillEqually)]
}
```

**Compared to vanilla**:

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

### Passing delegates

```swift
private let height: CGFloat = 50
private let style: ViewStyle = [.font(.big), .height(height)]
private let fieldStyle = style <<- .borderWidth(2)

final class LoginViewController: UIViewController {
    
    lazy var emailField: UITextField = fieldStyle <<- [.placeholder("Email"), .delegate(self)]
    lazy var passwordField: UITextField = fieldStyle <<- [.placeholder("Password"), .delegate(self)]
    
    // can line break merge
    lazy var loginButton: UIButton = style <<-
            .states([Normal("Login", .blue), Highlighted("Logging in...", .red)]) <-
            .target(self.target(#selector(loginButtonPressed))) <-
            [.color(.green), .cornerRadius(height/2)]
    
    lazy var stackView: UIStackView = .axis(.vertical) <-
            .views([self.emailField, self.passwordField, self.loginButton]) <-
            [.spacing(20), .layoutMargins(all: 20), .marginsRelative(true)]
    
    ...
}

extension LoginViewController: UITextFieldDelegate {
    public func textFieldDidEndEditing(_ textField: UITextField) {
        textField.validate()
    }
}

private extension LoginViewController {
    @objc func loginButtonPressed() {
        print("should login")
    }
}
```

Note how we pass in `self` as `associated value` to the attribute named `.delegate`, setting the `LoginViewController` class itself as `UITextViewDelegate`. 

**Compare to vanilla:**

```swift
private let height: CGFloat = 50
final class VanillaLoginViewController: UIViewController {
    
    lazy var emailField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Email"
        field.layer.borderWidth = 2
        field.font = .big
        field.delegate = self
        field.addConstraint(field.heightAnchor.constraint(equalToConstant: height))
        return field
    }()
    
    lazy var passwordField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Password"
        field.layer.borderWidth = 2
        field.font = .big
        field.delegate = self
        field.addConstraint(field.heightAnchor.constraint(equalToConstant: height))
        return field
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = height/2
        button.addConstraint(button.heightAnchor.constraint(equalToConstant: height))
        button.setTitle("Login", for: .normal)
        button.setTitle("Logging in..", for: .highlighted)
        button.setTitleColor(.blue, for: .normal)
        button.setTitleColor(.red, for: .highlighted)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(loginButtonPressed), for: .primaryActionTriggered)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.emailField, self.passwordField, self.loginButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        let margins: CGFloat = 20
        stackView.layoutMargins = UIEdgeInsets(top: margins, left: margins, bottom: margins, right: margins)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    ...
}

extension VanillaLoginViewController: UITextFieldDelegate {
    public func textFieldDidEndEditing(_ textField: UITextField) {
        textField.validate()
    }
}

private extension VanillaLoginViewController {
    @objc func loginButtonPressed() {
        print("should login")
    }
}
```

We can also use the `.delegates` attribute for `UITextViewDelegate` and more delegate types are coming.

## Supported attributes
Here are some of the attributes (this list gets updated manually...), take a look at the [full list here](https://github.com/Sajjon/ViewComposer/blob/master/Source/Classes/ViewAttribute/ViewAttribute.swift)

```swift
public enum ViewAttribute {
    case custom(BaseAttributed)
    case delegate(NSObjectProtocol)
    case dataSource(NSObjectProtocol)
    case dataSourceDelegate(NSObjectProtocol)
    
    //MARK: - View
    case hidden(Bool)
    case color(UIColor)
    case verticalHugging(LayoutPriority)
    case verticalCompression(LayoutPriority)
    case horizontalHugging(LayoutPriority)
    case horizontalCompression(LayoutPriority)
    case contentMode(UIViewContentMode)
    case height(CGFloat)
    case width(CGFloat)
    case layoutMargins(all: CGFloat)
    
    case userInteractable(Bool)
    case tintColor(UIColor)
    case clipsToBounds(Bool)
    case alpha(CGFloat)
    case opaque(Bool)
    case exclusiveTouch(Bool)
    case multipleTouchEnabled(Bool)
    case clearsContextBeforeDrawing(Bool)
    
    //MARK: - UIView: Layer
    case cornerRadius(CGFloat) /* might be overridden by: */; case radius(Radius)
    case borderWidth(CGFloat)
    case borderColor(UIColor)
    
    //MARK: - TextHolder
    case text(String)
    case font(UIFont)
    case textColor(UIColor)
    case `case`(Case)
    case textAlignment(NSTextAlignment)
    
    //MAKR: - FontSizeAdjusting (UILabel + UITextField)
    case adjustsFontSizeToFitWidth(Bool)
    
    //MARK: - PlaceholderOwner
    case placeholder(String)
    
    //MARK: - TextInputting (UITextField + UITextView)
    case editable(Bool)
    case clearsOnInsertion(Bool)
    case clearsOnBeginEditing(Bool)
    
    //MARK: - UILabel
    case numberOfLines(Int)
    case highlightedTextColor(UIColor)
    case minimumScaleFactor(CGFloat)
    case baselineAdjustment(UIBaselineAdjustment)
    case shadowColor(UIColor)
    case shadowOffset(CGSize)
    
    //MARK: - UITextField
    case clearButtonMode(UITextFieldViewMode)
    case borderStyle(UITextBorderStyle)
    
    //MARK: - UITextView
    case selectedRange(NSRange)
    
    //MARK: - ImageHolder
    case image(UIImage)
    
    //MARK: - UIScrollView
    case scrollEnabled(Bool)
    case contentSize(CGSize)
    case contentInset(UIEdgeInsets)
    case bounces(Bool)
    case alwaysBounceVertical(Bool)
    case alwaysBounceHorizontal(Bool)
    case pagingEnabled(Bool)
    case showsHorizontalScrollIndicator(Bool)
    case showsVerticalScrollIndicator(Bool)
    case scrollIndicatorInsets(UIEdgeInsets)
    case indicatorStyle(UIScrollViewIndicatorStyle)
    case decelerationRate(CGFloat)
    case delaysContentTouches(Bool)
    case canCancelContentTouches(Bool)
    case minimumZoomScale(CGFloat)
    case maximumZoomScale(CGFloat)
    case zoomScale(CGFloat)
    case bouncesZoom(Bool)
    case scrollsToTop(Bool)
    case keyboardDismissMode(UIScrollViewKeyboardDismissMode)
    
    //MARK: - ControlState
    case states([ControlState])

    //MARK: - Targetable
    case target(Actor)
    case enabled(Bool)
    case selected(Bool)
    case highlighted(Bool)
    
    //MARK: - UIButton
    case contentEdgeInsets(UIEdgeInsets)
    case titleEdgeInsets(UIEdgeInsets)
    case reversesTitleShadowWhenHighlighted(Bool)
    case imageEdgeInsets(UIEdgeInsets)
    case adjustsImageWhenHighlighted(Bool)
    case adjustsImageWhenDisabled(Bool)
    case showsTouchWhenHighlighted(Bool)
    
    //MARK: - UIStackView
    case axis(UILayoutConstraintAxis)
    case distribution(UIStackViewDistribution)
    case alignment(UIStackViewAlignment)
    case spacing(CGFloat)
    case margin(CGFloat)
    case marginsRelative(Bool)
    case baselineRelative(Bool)
    case views([UIView])
    
    //MARK: - CellRegisterable
    case registerCells([RegisterableCell])
        
    //MARK: - UICollectionView
    case collectionViewLayout(UICollectionViewLayout)
    case itemSize(CGSize)
    
    //MARK: - UISearchBar
    case prompt(String)
    case searchBarStyle(UISearchBarStyle)
    
    //MARK: - UISegmentedControl
    case segments([Segment])
    
    //MARK: ThumbTintColorOwner (UISwitch and UISlider)
    case thumbTintColor(UIColor?)
    
    //MARK: - UISwitch
    case on(Bool)
    case onTintColor(UIColor?)
    case onImage(UIImage?)
    case offImge(UIImage?)
    
    //MARK: - UISlider
    case sliderValue(Double)
    case sliderRange(Range<Double>)
}
```

## CAUTION: Avoid arrays with duplicate values.
As of now it is possible to create an attributes array with duplicate values, e.g.

```swift
// NEVER DO THIS!
let foobar: [ViewAttribute] = [.text("bar"), .text("foo")]
// NOR THIS
let foofoo: [ViewAttribute] = [.text("foo"), .text("foo")]

//NOR using style
let foobarStyle: Style = [.text("bar"), .text("foo")] // confusing!
// NOR this
let foofooStyle: Style = [.text("foo"), .text("foo")] // confusing!
```

It is possible to have an array of attributes containing duplicate values. But using it to instantiate a view, e.g. a `UILabel` will in fact ignore the duplicate value.

```swift
let foobar: [ViewAttribute] = [.text("foo"), .text("bar")] //contains both, since array may contain duplicates
let label: UILabel = make(foobar) // func `make` calls `let style = attributes.merge(slave: [])` removing duplicates.
print(label.text!) // prints "foo", since duplicate value `.text("bar")` has been removed by call to `make`
```

Thus it is **strongly** discouraged to instantiate arrays with duplicate values. But the scenarios where you are merging types with duplicates is handled, since you chose which attribute you wanna keep using either `merge:master` or `merge:slave`.

## Composables
An alternative to this, if you want to make use of some even more sugary syntax is to use the subclasses conforming to the type `Composable`. You can find some [examples (Label, Button, StackView etc) here](https://github.com/Sajjon/ViewComposer/tree/master/Source/Composables). 

In the current release of ViewComposer in order to use array literal, use must use the caret postfix operator `^` to create your `Composable` types subclassing `UIKit` classes.

```swift
final class Label: UILabel, Composable { ... }
...
let label: Label = [.text("foo")]^ // requires use of `ˆ`
```


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
    let label: UILabel
    
    init(_ style: ViewStyle? = nil) {
        let style = style <- .textAlignment(.center)]//default attribute
        label = style <- [.textColor(.red)] //default textColor
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
let fooLabel: FooLabel = [.custom(FooStyle([.foo("Foobar")])), .textColor(.red), .color(.cyan)]
```

Here we create the `FooLabel` and styling it with our custom `FooStyle` (container for `FooAttribute`) while also styling it with `textColor` and `backgroundColor`. This way you can combine custom attributes with "standard" ones. 

Whole code can be found [here in the example app](https://github.com/Sajjon/ViewComposer/blob/master/Example/Source/Views/FooLabel.swift)

**Please note that you cannot merging of custom attributes does not happen automatically**. See next section.

### Merging custom attributes

Check out [TriangleView.swift](https://github.com/Sajjon/ViewComposer/blob/master/Example/Source/Views/TriangleView.swift) for example of advanced usage of custom attributes.

## Roadmap
### Architecture/implementation
- [ ] Change implementation to use Codable/Encodable (Swift 4)?
- [x] Fix bug where classes conforming to `Composable` and inheriting from superclass conforming to `Makeable` cannot be instantiated using array literals. (requires ues of caret postfix operator `^`)

### Supported UIKit views
- [x] UIButton
- [x] UICollectionView
- [x] UIImageView
- [x] UILabel
- [x] UIPickerImageView
- [ ] UIScrollView
- [x] UISearchBar
- [x] UISegmentedControl
- [x] UISlider
- [x] UIStackView
- [x] UISwitch
- [x] UITableView
- [x] UITextField
- [x] UITextView

### Supported attributes
- [x] Support most layer attributes, such as `borderWidth`, `masksToBounds` etc..
- [x] Add attribute for delegates such as `UITextViewDelegate`, `UITableView`

