//
//  AuthManager.swift
//  peddles (iOS)
//
//  Created by Mike  Van Amburg on 6/24/22.
//

import Foundation
import Combine
import SwiftUI

class AuthManager: ObservableObject {
    @AppStorage("token") var token: String?
    private let client: APIClient
    private var cancellables = Set<AnyCancellable>()

    init(client: APIClient) {
        self.client = client
        if let storedToken = token{
            client.assign(accessToken: storedToken)
        } else {
            self.getToken()
        }
        
    }

    func getToken() {
        client
            .dispatch(GetTokenRequest())
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard case .failure(let error) = completion else {
                    print(completion)
                    return
                }
                //self?.state.error = error.identifiable
            } receiveValue: { response in
                self.token = response.accessToken
                self.client.assign(accessToken: response.accessToken)
            }
            .store(in: &cancellables)
    }
    
}
