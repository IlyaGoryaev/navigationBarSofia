//
//  Entity+CoreDataProperties.swift
//  navigationBarSofia
//
//  Created by Илья Горяев on 25.06.2023.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Favorites")
    }

    @NSManaged public var title: String?
    @NSManaged public var isFav: Bool

}

extension Entity : Identifiable {

}
