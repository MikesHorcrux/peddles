//
//  Policies.swift
//  peddles
//
//  Created by Mike  Van Amburg on 6/25/22.
//

import Foundation

struct Policies: Codable, Hashable{
    var policy: String?
    var url: String?
}

#if DEBUG
extension Policies{
    static func create(
        policy: String? = nil,
        url: String? = nil
    ) -> Self{
        Self()
    }
}
#endif
