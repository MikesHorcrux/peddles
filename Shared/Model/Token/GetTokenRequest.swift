//
//  GetTokenRequest.swift
//  peddles (iOS)
//
//  Created by Mike  Van Amburg on 6/24/22.
//

import Foundation

struct GetTokenRequest: Request{
    typealias ReturnType = Token

    let path = "oauth2/token"
    let method: HTTPMethod = .post
    let client = ClientSecrets(grantType: "client_credentials", clientId: "nc0DzU2zCeHj2eQsdVsVmH1FIqOSTh2nrUzhVzXVOginMvZcvw", clientSecret: "a6mf8lAcgCrrl5CvZx4gAy0runRAn2qMBM8M2tdN")
    var bodyData: Data? {
        try? JSON.encoder.encode(client)
    }
}
