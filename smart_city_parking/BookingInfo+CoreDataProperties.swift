//
//  BookingInfo+CoreDataProperties.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-22.
//
//

import Foundation
import CoreData


extension BookingInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BookingInfo> {
        return NSFetchRequest<BookingInfo>(entityName: "BookingInfo")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var parkingName: String?
    @NSManaged public var arrivingTime: String?
    @NSManaged public var exitTime: String?
    @NSManaged public var date: Date?
    @NSManaged public var vehicle: String?
    @NSManaged public var slot: String?
    @NSManaged public var totalHours: String?
    @NSManaged public var amount: String?

}

extension BookingInfo : Identifiable {

}
