//
//  GetAnimals.swift
//  peddles (iOS)
//
//  Created by Mike  Van Amburg on 6/25/22.
//

import Foundation

struct GetAnimals: Request {
    typealias ReturnType = Animals

    let method: HTTPMethod = .get
    var queryParams: [String: String]?
    var path: String {
        "animals"
    }
}
