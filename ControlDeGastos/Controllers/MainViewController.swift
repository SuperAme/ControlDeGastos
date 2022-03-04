//
//  ViewController.swift
//  ControlDeGastos
//
//  Created by Américo MQ on 31/01/22.
//

import UIKit

class MainViewController: UIViewController {
    
    var userPasswordSelected: UserInfo? {
        didSet {
//            loadFinances()
//            print(userPasswordSelected)
        }
    }

    func getSaldo() -> String {
        return "Saldo"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        
//        self.navigationItem.hidesBackButton = true
        
//        let titulo = getSaldo()
        title = "Control de gastos"
    }

}

