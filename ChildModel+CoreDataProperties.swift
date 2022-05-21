//
//  ChildModel+CoreDataProperties.swift
//  OneToManyCoreData
//
//  Created by 薗部拓人 on 2022/05/18.
//
//

import Foundation
import CoreData


extension ChildModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ChildModel> {
        return NSFetchRequest<ChildModel>(entityName: "ChildModel")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var child: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var parent: ParentModel?

}

extension ChildModel : Identifiable {

}
