//
//  AnimalColors.swift
//  peddles (iOS)
//
//  Created by Mike  Van Amburg on 6/25/22.
//

import Foundation

struct AnimalColors: Codable{
    var primary: String
    var secondary: String?
}

#if DEBUG
extension AnimalColors {
    static func create(
        primary: String = "brown",
        secondary: String = "white"
    ) -> Self {
        Self(primary: primary, secondary: secondary)
    }
}
#endif
