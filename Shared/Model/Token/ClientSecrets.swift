//
//  ClientSecrets.swift
//  peddles (iOS)
//
//  Created by Mike  Van Amburg on 6/24/22.
//

import Foundation

struct ClientSecrets: Codable {
    var grantType: String
    var clientId: String
    var clientSecret: String
}
