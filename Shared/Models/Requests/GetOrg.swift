//
//  GetOrg.swift
//  peddles
//
//  Created by Mike  Van Amburg on 6/26/22.
//

import Foundation

struct GetOrg: Request {
    typealias ReturnType = SingleOrganization

    let method: HTTPMethod = .get

    var queryParams: [String: String]?
    var id: String

    var path: String {
        "organizations/\(id)"
    }
}
