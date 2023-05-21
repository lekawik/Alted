//
//  ViewController.swift
//  Alted
//
//  Created by Soren SAMAMA on 21/05/2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = .body
        textField.adjustsFontForContentSizeCategory = true
        textField.placeholder = "Username"
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = .body
        textField.adjustsFontForContentSizeCategory = true
        textField.placeholder = "Password"
        textField.isSecureTextEntry = false // TODO: Make it secure, and add a show button
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        var configuration = UIButton.Configuration.borderedProminent()
        configuration.title = "LogIn"
        
        let button = UIButton(configuration: configuration)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addAction(UIAction { _ in
            APIManager.shared.setUsername(self.usernameTextField.text)
            APIManager.shared.setPassword(self.passwordTextField.text)
            
            Task {
                do {
                    print(try await APIManager.shared.authenticator.logIn())
                } catch {
                    print("An error during login: \(error)")
                }
            }
        }, for: .touchUpInside)

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            usernameTextField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            usernameTextField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            usernameTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -8),
            
            passwordTextField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            loginButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8)
        ])
    }
}
