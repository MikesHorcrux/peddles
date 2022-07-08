//
//  GetAnimal.swift
//  peddles
//
//  Created by Mike  Van Amburg on 7/8/22.
//

import Foundation

struct GetAnimal: Request {
    typealias ReturnType = SingleAnimal

    let id: String
    let method: HTTPMethod = .get
    var queryParams: [String: String]?
    var path: String {
        "animals/\(id)"
    }
}
