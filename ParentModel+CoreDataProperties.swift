//
//  ParentModel+CoreDataProperties.swift
//  OneToManyCoreData
//
//  Created by 薗部拓人 on 2022/05/18.
//
//

import Foundation
import CoreData


extension ParentModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ParentModel> {
        return NSFetchRequest<ParentModel>(entityName: "ParentModel")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var parent: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var children: NSSet?

}

// MARK: Generated accessors for children
extension ParentModel {

    @objc(addChildrenObject:)
    @NSManaged public func addToChildren(_ value: ChildModel)

    @objc(removeChildrenObject:)
    @NSManaged public func removeFromChildren(_ value: ChildModel)

    @objc(addChildren:)
    @NSManaged public func addToChildren(_ values: NSSet)

    @objc(removeChildren:)
    @NSManaged public func removeFromChildren(_ values: NSSet)

}

extension ParentModel : Identifiable {

}
