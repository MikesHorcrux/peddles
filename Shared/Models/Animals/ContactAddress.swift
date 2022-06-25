//
//  ContactAddress.swift
//  peddles (iOS)
//
//  Created by Mike  Van Amburg on 6/25/22.
//

import Foundation

struct ContactAddress: Codable {
    var address1: String?
    var address2: String?
    var city: String
    var state: String
    var postcode: String
    var country: String
}

#if DEBUG
extension ContactAddress{
    static func create(
        address1: String? = nil,
        address2: String? = nil,
        city: String = "Jersey City",
        state: String = "NJ",
        postcode: String = "07097",
        county: String = "US"
    ) -> Self {
        Self(city: city, state: state, postcode: postcode, country: county)
    }
}
#endif
