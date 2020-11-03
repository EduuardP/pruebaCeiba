//
//  Post+CoreDataProperties.swift
//  pruebaCeiba
//
//  Created by IMac on 30/10/20.
//
//

import Foundation
import CoreData


extension Post {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Post> {
        return NSFetchRequest<Post>(entityName: "Post")
    }

    @NSManaged public var body: String?
    @NSManaged public var id: Int16
    @NSManaged public var title: String?
    @NSManaged public var userId: Int16
    @NSManaged public var belongsTo: User?

}

extension Post : Identifiable {

}
