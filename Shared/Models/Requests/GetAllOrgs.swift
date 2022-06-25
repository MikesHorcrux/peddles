//
//  GetAllOrgs.swift
//  peddles
//
//  Created by Mike  Van Amburg on 6/25/22.
//

import Foundation

struct GetAllOrgs: Request {
    typealias ReturnType = Organizations

    let method: HTTPMethod = .get
    var queryParams: [String : String]?
    var path: String {
        "organizations"
    }
}
