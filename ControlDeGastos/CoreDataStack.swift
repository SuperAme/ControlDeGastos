//
//  CoreDataStack.swift
//  ControlDeGastos
//
//  Created by Américo MQ on 01/02/22.
//

import Foundation
import CoreData
import UIKit

class CoreDataStack {
    
    private static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ControlDeGastos")
        container.loadPersistentStores { (desc, error) in
            if let error = error {
                print("Error loading store \(desc) - \(error)")
                return
            }
            print("Database ready!")
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return Self.persistentContainer.viewContext
    }
    
//    private func setupDatabase() {
//        container.loadPersistentStores { (desc, error) in
//            if let error = error {
//                print("Error loading store \(desc) - \(error)")
//                return
//            }
//            print("Database ready!")
//        }
//
//    }
    
    func createUser(mail: String, pass: String, ingreso: Float, egresos: Float) {
        let context = context
        
        let user = UserInfo(context: context)
        user.email = mail
        user.password = pass
        
        let finances = Finanzas(context: context)
        finances.egresos = egresos
        finances.ingresos = ingreso
        finances.user = user
        
        
        do {
            try context.save()
        } catch {
            print("Error saving user - \(error)")
        }
    }
}

