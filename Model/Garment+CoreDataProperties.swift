//
//  Garment+CoreDataProperties.swift
//  LULULemonAssessment
//
//  Created by Rick Martinez on 6/8/22.
//
//

import Foundation
import CoreData


extension Garment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Garment> {
        return NSFetchRequest<Garment>(entityName: "Garment")
    }

    @NSManaged public var creationDate: Date?
    @NSManaged public var name: String?

}

extension Garment : Identifiable {

}
