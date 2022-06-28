//
//  Animals.swift
//  peddles (iOS)
//
//  Created by Mike  Van Amburg on 6/25/22.
//

import Foundation

struct Animals: Codable {
    var animals: [Animal]
}

#if DEBUG
extension Animals {
    static func create(
        animals: [Animal] = [.create()]
    ) -> Self {
        Self(animals: animals)
    }
}
#endif
