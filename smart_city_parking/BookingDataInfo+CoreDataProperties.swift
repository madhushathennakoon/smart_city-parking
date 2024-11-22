//
//  BookingDataInfo+CoreDataProperties.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-22.
//
//

import Foundation
import CoreData


extension Info {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BookingDataInfo> {
        return NSFetchRequest<BookingDataInfo>(entityName: "BookingDataInfo")
    }

    @NSManaged public var amount: String?
    @NSManaged public var arrivingTime: String?
    @NSManaged public var date: Date?
    @NSManaged public var exitTime: String?
    @NSManaged public var parkingName: String?
    @NSManaged public var slot: String?
    @NSManaged public var totalHours: String?
    @NSManaged public var vehicleName: String?
    @NSManaged public var vehicleNumber: String?

}

extension Info : Identifiable {

}
