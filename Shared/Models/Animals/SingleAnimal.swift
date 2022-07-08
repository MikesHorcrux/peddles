//
//  SingleAnimal.swift
//  peddles
//
//  Created by Mike  Van Amburg on 7/8/22.
//

import Foundation

struct SingleAnimal: Codable {
    var animal: Animal
}

#if DEBUG
extension SingleAnimal {
    static func create(animal: Animal = .create()) -> Self{
        Self(animal: animal)
    }
}
#endif
