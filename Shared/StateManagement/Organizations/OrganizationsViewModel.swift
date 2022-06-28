//
//  OrganizationsViewModel.swift
//  peddles
//
//  Created by Mike  Van Amburg on 6/26/22.
//

import Foundation
import Combine

class OrganizationsViewModel: ObservableObject {
    @Published var state = OrganizationsState()

    private let client: APIClient
    private var cancellables = Set<AnyCancellable>()

    init(client: APIClient) {
        self.client = client
    }

    func fetchOrganization(id: String) {
        client
            .dispatch(GetOrg(id: id))
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard case .failure(let error) = completion else {
                    return
                }
                // todo: add error handling
                self?.state.error = error.identifiable
            } receiveValue: { [weak self] org in
                self?.state.orgainization = org.organization
            }
            .store(in: &cancellables)
    }
}
