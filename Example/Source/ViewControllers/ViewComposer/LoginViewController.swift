//
//  LoginViewController.swift
//  Example
//
//  Created by Alexander Cyon on 2017-06-10.
//  Copyright © 2017 Alexander Cyon. All rights reserved.
//

import UIKit
import ViewComposer

private let height: CGFloat = 50
private let style: ViewStyle = [.font(.big), .height(height)]
private let fieldStyle = style <<- .borderWidth(2)
private let borderColorNormal: UIColor = .blue

final class LoginViewController: UIViewController, StackViewOwner {
    
    lazy var emailField: UITextField = fieldStyle <<- [.placeholder("Email"), .delegate(self)]
    lazy var passwordField: UITextField = fieldStyle <<- [.placeholder("Password"), .delegate(self)]
    
    lazy var loginButton: Button = style <<-
        .states([Normal("Login", .blue, borderColor: borderColorNormal), Highlighted("Logging in...", .red, borderColor: .red)]) <-
        .target(self.target(#selector(loginButtonPressed))) <-
       [.color(.green), .cornerRadius(height/2), .borderWidth(2), .borderColor(borderColorNormal)]
    
    lazy var stackView: UIStackView = .axis(.vertical) <-
        .views([self.emailField, self.passwordField, self.loginButton]) <-
        [.spacing(20), .layoutMargins(all: 20), .marginsRelative(true)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        title = "ViewComposer - LoginViewController"
    }
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
