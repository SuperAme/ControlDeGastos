//
//  SignUpViewController.swift
//  ControlDeGastos
//
//  Created by Américo MQ on 01/02/22.
//

import UIKit
import CoreData

class SignUpViewController: UIViewController {
    
    var managedContext: NSManagedObjectContext!
    var encryptController = CryptoController()
    var validator = EmailValidatorController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @objc func onSignUpButtonTouch() {
        if let email = emailTextField.text, let password = passwordTextField.text {
            if validator.isValidEmail(email) {
                let encryptedPassword = encryptController.encryptData(password)
                //TODO Insert CoreData
            }
        }
        print("onSignUpButtonTouch")
    }
    
    @objc func onBackButtonTouch() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
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
    
    let signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Create User", for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(onSignUpButtonTouch), for: .touchUpInside)
        return button
    }()

    func setupUI() {
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(onBackButtonTouch))
        
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signUpButton)
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            emailTextField.heightAnchor.constraint(equalToConstant: 30),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            passwordTextField.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            signUpButton.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            signUpButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}
extension SignUpViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if validator.isValidEmail(emailTextField.text!) {
            emailTextField.layer.borderColor = UIColor.darkGray.cgColor
            passwordTextField.layer.borderColor = UIColor.darkGray.cgColor
        } else {
            emailTextField.layer.borderColor = UIColor.systemRed.cgColor
            passwordTextField.layer.borderColor = UIColor.darkGray.cgColor
        }
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case emailTextField:
            emailTextField.layer.borderColor = UIColor.systemBlue.cgColor
        case passwordTextField:
            passwordTextField.layer.borderColor = UIColor.systemBlue.cgColor
        default:
            emailTextField.layer.borderColor = UIColor.systemPink.cgColor
            passwordTextField.layer.borderColor = UIColor.systemPink.cgColor
        }
    }
}
