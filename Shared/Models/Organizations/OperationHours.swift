//
//  OperationHours.swift
//  peddles (iOS)
//
//  Created by Mike  Van Amburg on 6/25/22.
//

import Foundation

struct OperationHours: Codable {
    var monday: String?
    var tuesday: String?
    var wednessday: String?
    var thursday: String?
    var friday: String?
    var saturday: String?
    var sunday: String?
}

#if DEBUG
extension OperationHours{
    static func create(
        monday: String? = nil,
        tuesday: String? = nil,
        wednessday: String? = nil,
        thursday: String? = "hours",
        friday: String? = nil,
        saturday: String? = nil,
        sunday: String? = nil
    ) -> Self{
        Self(thursday: thursday)
    }
}
#endif
