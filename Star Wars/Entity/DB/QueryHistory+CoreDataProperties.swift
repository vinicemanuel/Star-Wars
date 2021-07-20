//
//  QueryHistory+CoreDataProperties.swift
//  Star Wars
//
//  Created by Vinicius Emanuel on 08/07/21.
//
//

import Foundation
import CoreData


extension QueryHistory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<QueryHistory> {
        return NSFetchRequest<QueryHistory>(entityName: "QueryHistory")
    }

    @NSManaged public var query: String!
    @NSManaged public var timeStamp: Date!

}

extension QueryHistory : Identifiable {

}
