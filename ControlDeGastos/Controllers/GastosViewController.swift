//
//  GastosViewController.swift
//  ControlDeGastos
//
//  Created by Américo MQ on 03/03/22.
//

import Foundation
import UIKit

class GastosViewController: UIViewController {
    
    var selectedUser: UserInfo? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc func onAmountInsertButton() {
        print("onAmountInsertButton")
    }
    
    let amountTextField: UITextField = {
        let amountTF = UITextField()
        amountTF.translatesAutoresizingMaskIntoConstraints = false
        amountTF.placeholder = "Write your amount"
        amountTF.textAlignment = .center
        amountTF.layer.borderColor = UIColor.darkGray.cgColor
        amountTF.layer.borderWidth = 1.0
        return amountTF
    }()
    
    let amountSegmentedControl: UISegmentedControl = {
        let amountSegCtrl = UISegmentedControl()
        amountSegCtrl.translatesAutoresizingMaskIntoConstraints = false
        amountSegCtrl.insertSegment(withTitle: "Gasto", at: 0, animated: true)
        amountSegCtrl.insertSegment(withTitle: "Ingreso", at: 1, animated: true)
        return amountSegCtrl
    }()
    
    let amountInsertButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Insert Amount", for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(onAmountInsertButton), for: .touchUpInside)
        return button
    }()
    
    func setupUI() {
        
        view.backgroundColor = .white
        
        view.addSubview(amountTextField)
        view.addSubview(amountSegmentedControl)
        view.addSubview(amountInsertButton)
        
        NSLayoutConstraint.activate([
            amountTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            amountTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            amountTextField.heightAnchor.constraint(equalToConstant: 30),
            amountTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            amountSegmentedControl.topAnchor.constraint(equalTo: amountTextField.bottomAnchor, constant: 30),
            amountSegmentedControl.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            amountSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            amountInsertButton.topAnchor.constraint(equalTo: amountSegmentedControl.bottomAnchor, constant: 60),
            amountInsertButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            amountInsertButton.heightAnchor.constraint(equalToConstant: 30),
            amountInsertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
}
