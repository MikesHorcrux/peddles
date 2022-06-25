//
//  Organization.swift
//  peddles (iOS)
//
//  Created by Mike  Van Amburg on 6/25/22.
//

import Foundation

struct Organization: Codable {
    var id: String
    var name: String
    var email: String
    var phone: String
    var address: PFAddress
    var hours: OperationHours
    var url: String
    var website: String?
    var missionStatement: String?
    var adoption: Policies
    var photos: [Photos]?
}

#if DEBUG
extension Organization{
    static func create(
        id: String = "tx233",
        name: String = "NJ333 - Petfinder Test Account",
        email: String = "no-reply@petfinder.com",
        phone: String = "555-555-5555",
        address: PFAddress = .create(),
        hours: OperationHours = .create(),
        url: String = "https://www.petfinder.com/member/us/nj/jersey-city/nj333-petfinder-test-account/?referrer_id=d7e3700b-2e07-11e9-b3f3-0800275f82b1",
        adoption: Policies = .create(),
        photos: [Photos] = [.create()]
    ) -> Self {
        Self(id: id, name: name, email: email, phone: phone, address: address, hours: hours, url: url, adoption: adoption, photos: photos)
    }
}
#endif
