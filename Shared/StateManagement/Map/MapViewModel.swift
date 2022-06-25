//
//  MapViewModel.swift
//  peddles
//
//  Created by Mike  Van Amburg on 6/25/22.
//


import Foundation
import Combine

class MapViewModel: ObservableObject {
    @Published var state = MapState()
    
    private let client: APIClient
    private var cancellables = Set<AnyCancellable>()
    
    init(client: APIClient) {
        self.client = client
        //fetchAllOrgs()
    }
    
    func fetchAllOrgs() {
        client
            .dispatch(GetAllOrgs())
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard case .failure(let error) = completion else {
                    print(completion)
                    return
                }
                self?.state.error = error.identifiable
            } receiveValue: { [weak self] response in
                print(response)
            }
            .store(in: &cancellables)
    }

    func fetchOrgsInArea(zipCode: String) {
        client
            .dispatch(GetAllOrgs(queryParams:
                                    [
                                        "location": zipCode,
                                        "distance": 500
                                    ]))
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard case .failure(let error) = completion else {
                    print(completion)
                    return
                }
                self?.state.error = error.identifiable
            } receiveValue: { [weak self] response in
                print(response)
            }
            .store(in: &cancellables)
    }

}
