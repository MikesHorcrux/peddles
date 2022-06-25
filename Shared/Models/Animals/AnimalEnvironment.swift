//
//  AnimalEnvironment.swift
//  peddles (iOS)
//
//  Created by Mike  Van Amburg on 6/25/22.
//

import Foundation

struct AnimalEnvironment: Codable{
    var children: Bool
    var dogs: Bool
    var cats: Bool
}


#if DEBUG
extension AnimalEnvironment {
    static func create(
        children: Bool = true,
        dogs: Bool  = true,
        cats: Bool = true
    ) -> Self {
        Self(children: children, dogs: dogs, cats: cats)
    }
}
#endif
