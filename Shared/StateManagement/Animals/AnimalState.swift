//
//  AnimalState.swift
//  peddles
//
//  Created by Mike  Van Amburg on 6/26/22.
//

import Foundation

struct AnimalState {
    var error: IdentifiableError?
    var animals: [Animal] = []
    var animal: Animal?
}
