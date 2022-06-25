//
//  AnimalAttributes.swift
//  peddles (iOS)
//
//  Created by Mike  Van Amburg on 6/25/22.
//

import Foundation

struct AnimalAttributes: Codable {
    var spayedNeutered: Bool
    var houseTrained: Bool
    var declawed: Bool
    var specialNeeds: Bool
    var shotsCurrent: Bool
}

#if DEBUG
extension AnimalAttributes {
    static func create(
        spayedNeutered: Bool = true,
        houseTrained: Bool = true,
        declawed: Bool = true,
        specialNeeds: Bool = true,
        shotsCurrent: Bool = true
    ) -> Self {
        Self(spayedNeutered: spayedNeutered, houseTrained: houseTrained, declawed: declawed, specialNeeds: specialNeeds, shotsCurrent: shotsCurrent)
    }
}
#endif
