//
//  MainTabBarController.swift
//  ControlDeGastos
//
//  Created by Américo MQ on 15/02/22.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(onLogOutTouch))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onAddButtonTouch))
    }
    
    @objc func onLogOutTouch() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func onAddButtonTouch() {
        print("Add pressed")
    }
}
