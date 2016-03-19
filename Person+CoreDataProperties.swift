//
//  Person+CoreDataProperties.swift
//  CRUD
//
//  Created by Brian Douglas on 2/21/16.
//  Copyright © 2016 MutualFun. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Person {

    @NSManaged var name: String?
    @NSManaged var age: NSNumber?

}
