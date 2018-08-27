//
//  AppDelegate.swift
//  ViewComposer-Example
//
//  Created by Alexander Cyon on 2017-05-30.
//  Copyright © 2017 Alexander Cyon. All rights reserved.
//

import UIKit
import ViewComposer

@UIApplicationMain
class AppDelegate: UIResponder {
    var window: UIWindow?
}

extension AppDelegate: UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        return true
    }
}

//MARK: Private Methods
private extension AppDelegate {
    
    func setupWindow() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        window.backgroundColor = UIColor.white
        let navigationController = UINavigationController(rootViewController: ViewController())
        window.rootViewController = navigationController
        self.window = window
    }
}


class ViewController: UIViewController {

    lazy var viewStyle: ViewStyle = [.backgroundColor(.red)]
    lazy var labelStyle: LabelStyle = [.numberOfLines(0), .backgroundColor(.red)]
    lazy var greenLabel: UILabel = [.numberOfLines(0), .backgroundColor(.green), .text("Green"), .textColor(.red)]
    lazy var redLabel: UILabel = [.numberOfLines(0), .backgroundColor(.red), .text("Red"), .textColor(.blue)]
    lazy var blueLabel: UILabel = [.numberOfLines(0), .backgroundColor(.blue), .text("Blue"), .textColor(.green)]
    lazy var textView: UITextView = [.isSelectable(true), TextViewAttribute.isEditable(true), TextViewAttribute.text("""
        Lorem ipsum dolor sit amet, an mel tractatos dignissim, mundi quidam ei sit. Melius vivendum assentior duo ne. Prima meliore partiendo te mei, qui ut enim mucius concludaturque. At epicuri expetendis qui. Cu eos hendrerit interesset omittantur, ut magna menandri eos.

        Mel cu aliquid fierent, has ullum tempor an. Probatus abhorreant scriptorem ex mel, enim aliquam sensibus ea usu, ne malis maiorum albucius mea. Ut pri elitr fabellas. Te rebum ridens cotidieque usu, in inani principes definitiones vim. An pro illum aliquid commune, mei ne esse explicari mediocritatem.
"""
), TextViewAttribute.textColor(.green), .backgroundColor(.orange)]
    lazy var stackView: UIStackView = [.axis(.vertical), .arrangedSubviews([.spacer(150), greenLabel, redLabel, blueLabel, textView, .spacer]), .distribution(.fill)]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stackView)
        stackView.edgesToSuperView()
    }
}
extension UIView {
    func edgesToSuperView() {
        guard let superview = superview else { return }
        topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
    }
}

final class Spacer: UIView {
    let height: CGFloat
    init(height: CGFloat = UIViewNoIntrinsicMetric, color: UIColor = .white) {
        self.height = height
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = color
    }
    required init?(coder aDecoder: NSCoder) {
        Swift.fatalError("required init")
    }
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: height)
    }
}

extension UIView {
    static var spacer: Spacer { return Spacer() }
    static func spacer(_ height: CGFloat = UIViewNoIntrinsicMetric, color: UIColor = .white) -> Spacer {
        return Spacer(height: height, color: color)
    }
}


