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
    
    func getInfoFromPass(encriptedPass: String) -> [UserInfo]? {
        
        let context = context
        let query = "test@test.com"
        
        let fetchRequest: NSFetchRequest<UserInfo> = UserInfo.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email LIKE %@", query)
        
        do {
            let result = try context.fetch(UserInfo.fetchRequest())
            return result
        } catch let error{
            return nil
        }
        
//        let result = try! context.fetch(UserInfo.fetchRequest())
        
//        let fetchRequest: NSFetchRequest<UserInfo>
//        fetchRequest = UserInfo.fetchRequest()
//        let resultPredicate = NSPredicate(format: "email LIKE %@", query)
//
//        fetchRequest.predicate = NSPredicate(format: "password LIKE %@", "ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff")
//
//        let context = context
//
//        let objects = try! context.fetch(fetchRequest)
//
//        print(objects)
    }
}

