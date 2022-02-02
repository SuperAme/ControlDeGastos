//
//  UserInfo+CoreDataProperties.swift
//  ControlDeGastos
//
//  Created by Américo MQ on 01/02/22.
//
//

import Foundation
import CoreData


extension UserInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserInfo> {
        return NSFetchRequest<UserInfo>(entityName: "UserInfo")
    }

    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var finances: NSOrderedSet?

}

// MARK: Generated accessors for finances
extension UserInfo {

    @objc(insertObject:inFinancesAtIndex:)
    @NSManaged public func insertIntoFinances(_ value: Finanzas, at idx: Int)

    @objc(removeObjectFromFinancesAtIndex:)
    @NSManaged public func removeFromFinances(at idx: Int)

    @objc(insertFinances:atIndexes:)
    @NSManaged public func insertIntoFinances(_ values: [Finanzas], at indexes: NSIndexSet)

    @objc(removeFinancesAtIndexes:)
    @NSManaged public func removeFromFinances(at indexes: NSIndexSet)

    @objc(replaceObjectInFinancesAtIndex:withObject:)
    @NSManaged public func replaceFinances(at idx: Int, with value: Finanzas)

    @objc(replaceFinancesAtIndexes:withFinances:)
    @NSManaged public func replaceFinances(at indexes: NSIndexSet, with values: [Finanzas])

    @objc(addFinancesObject:)
    @NSManaged public func addToFinances(_ value: Finanzas)

    @objc(removeFinancesObject:)
    @NSManaged public func removeFromFinances(_ value: Finanzas)

    @objc(addFinances:)
    @NSManaged public func addToFinances(_ values: NSOrderedSet)

    @objc(removeFinances:)
    @NSManaged public func removeFromFinances(_ values: NSOrderedSet)

}

extension UserInfo : Identifiable {

}
