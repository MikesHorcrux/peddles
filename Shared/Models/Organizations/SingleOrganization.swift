//
//  SingleOrganization.swift
//  peddles
//
//  Created by Mike  Van Amburg on 6/26/22.
//

import Foundation

struct SingleOrganization: Codable{
    var organization: Organization
}

#if DEBUG
extension SingleOrganization {
    static func create(organization: Organization = .create()) -> Self{
        Self(organization: organization)
    }
}
#endif
