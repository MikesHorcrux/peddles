//
//  AnimalContact.swift
//  peddles (iOS)
//
//  Created by Mike  Van Amburg on 6/25/22.
//

import Foundation

struct AnimalContact: Codable{
    var email: String?
    var phone: String?
    var address: PFAddress
}

#if DEBUG
extension AnimalContact{
    static func create(
        email: String = "petfindertechsupport@gmail.com",
        phone: String = "555-555-5555",
        address: PFAddress = .create()
    ) -> Self{
        Self(email: email, phone: phone, address: address)
    }
}
#endif
