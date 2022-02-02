//
//  LoginViewController.swift
//  ControlDeGastos
//
//  Created by Américo MQ on 31/01/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    let emailTextField: UITextField = {
        let mailTF = UITextField()
        mailTF.translatesAutoresizingMaskIntoConstraints = false
        mailTF.placeholder = "Write your Email"
        mailTF.textAlignment = .center
        mailTF.layer.borderColor = UIColor.darkGray.cgColor
        mailTF.layer.borderWidth = 1.0
        return mailTF
    }()
    
    let passwordTextField: UITextField = {
        let passTF = UITextField()
        passTF.translatesAutoresizingMaskIntoConstraints = false
        passTF.placeholder = "Write your password"
        passTF.isSecureTextEntry = true
        passTF.textAlignment = .center
        passTF.layer.borderColor = UIColor.darkGray.cgColor
        passTF.layer.borderWidth = 1.0
        return passTF
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Login", for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(onLoginTouch), for: .touchUpInside)
        return button
    }()
    
    
    
    let createUserButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .systemBlue
        
        let attributesForButtonText: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.systemBlue,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        
        let attributedButtonTitle = NSMutableAttributedString(
            string: "Create User",
            attributes: attributesForButtonText
        )
        
        button.setAttributedTitle(attributedButtonTitle, for: .normal)
        button.addTarget(self, action: #selector(onCreateUserTouch), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLoginUI()
    }
    
    @objc func onLoginTouch() {
        print("onLoginTouch")
        self.navigationController?.pushViewController(MainViewController(), animated: true)
    }
    
    @objc func onCreateUserTouch() {
        self.navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
    
    func setupLoginUI() {
        
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(createUserButton)
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            emailTextField.heightAnchor.constraint(equalToConstant: 30),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            passwordTextField.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            loginButton.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            loginButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createUserButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30),
            createUserButton.widthAnchor.constraint(equalTo: loginButton.widthAnchor),
            createUserButton.heightAnchor.constraint(equalTo: loginButton.heightAnchor),
            createUserButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
