//
//  Organizations.swift
//  peddles
//
//  Created by Mike  Van Amburg on 6/25/22.
//

import Foundation

struct Organizations: Codable, Hashable {
    var organizations: [Organization]
}

#if DEBUG
extension Organizations{
    static func create(organizations: [Organization] = [.create()]) -> Self {
        Self(organizations: organizations)
    }
}
#endif
