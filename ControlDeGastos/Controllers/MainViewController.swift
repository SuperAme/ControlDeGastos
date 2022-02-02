//
//  ViewController.swift
//  ControlDeGastos
//
//  Created by Américo MQ on 31/01/22.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        setupUI()
    }
    
    @objc func onLogOutTouch() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func setupUI() {
        self.navigationItem.hidesBackButton = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "LogOut", style: .plain, target: self, action: #selector(onLogOutTouch))
    }

}

