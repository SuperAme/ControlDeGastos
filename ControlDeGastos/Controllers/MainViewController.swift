//
//  ViewController.swift
//  ControlDeGastos
//
//  Created by Américo MQ on 31/01/22.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    
    let manager = CoreDataStack()
    var gastosArray = [Finanzas]()
    
    var selectedUser: UserInfo? = nil

    func getSaldo() -> String {
        return "Saldo"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        gastosTableView.dataSource = self
        loadFinances()
    }
    
    var gastosTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    func loadFinances() {
        
        let request: NSFetchRequest<Finanzas> = Finanzas.fetchRequest()
        let userPredicate = NSPredicate(format: "user.email MATCHES %@", selectedUser!.email!)
        request.predicate = userPredicate
        
        do {
            gastosArray = try manager.context.fetch(request)
        } catch {
            print("Error fetching gastos \(error.localizedDescription)")
        }
        
        gastosTableView.reloadData()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(gastosTableView)
        
        NSLayoutConstraint.activate([
            gastosTableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            gastosTableView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
//        self.navigationItem.hidesBackButton = true
        
//        let titulo = getSaldo()
        title = "Control de gastos"
    }

}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gastosArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = gastosTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(gastosArray[indexPath.row].ingresos)"
        return cell
    }
}

