//
//  AnimalBreeds.swift
//  peddles (iOS)
//
//  Created by Mike  Van Amburg on 6/25/22.
//

import Foundation

struct AnimalBreeds: Codable {
    var primary: String
    var secondary: String?
    var mixed: Bool
    var unknown: Bool
}

#if DEBUG
extension AnimalBreeds {
    static func create(
        primary: String = "American Shorthair",
        secondary: String? = nil,
        mixed: Bool = false,
        unknown: Bool = true
    ) -> Self {
        Self(primary: primary, mixed: mixed, unknown: unknown)
    }
}
#endif
