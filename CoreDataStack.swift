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
    private let modelName: String
    
    lazy var managedContext: NSManagedObjectContext = {
        return self.storeContainer.viewContext
    }()
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: self.modelName)
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                print("Unresolved error \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    func saveContext() {
        guard managedContext.hasChanges else { return }
        
        do {
            try managedContext.save()
        } catch let error {
            print("Unresolved error \(error.localizedDescription)")
        }
    }
}

