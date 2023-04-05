//
//  FoodProducts+CoreDataProperties.swift
//  FoodApp
//
//  Created by Александр Рахимов on 04.04.2023.
//
//

import Foundation
import CoreData


extension FoodProducts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FoodProducts> {
        return NSFetchRequest<FoodProducts>(entityName: "FoodProducts")
    }

    @NSManaged public var type: String?
    @NSManaged public var text: String?
    @NSManaged public var image: String?
    @NSManaged public var price: String?
    @NSManaged public var title: String?
}

extension FoodProducts : Identifiable {}

