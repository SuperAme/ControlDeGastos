//
//  Finanzas+CoreDataProperties.swift
//  ControlDeGastos
//
//  Created by Américo MQ on 01/02/22.
//
//

import Foundation
import CoreData


extension Finanzas {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Finanzas> {
        return NSFetchRequest<Finanzas>(entityName: "Finanzas")
    }

    @NSManaged public var ingresos: Float
    @NSManaged public var egresos: Float
    @NSManaged public var user: UserInfo?

}

extension Finanzas : Identifiable {

}
