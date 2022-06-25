//
//  AnimalsViewModel.swift
//  peddles (iOS)
//
//  Created by Mike  Van Amburg on 6/25/22.
//

import Foundation
import Combine

class AnimalsViewModel: ObservableObject {
    //@Published var state = ProfileState()
    
    private let client: APIClient
    private var cancellables = Set<AnyCancellable>()
    
    init(client: APIClient) {
        self.client = client
        fetchAnimals()
    }
    
    func fetchAnimals() {
        client
            .dispatch(GetAnimals())
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard case .failure(let error) = completion else {
                    print(completion)
                    return
                }
                //self?.state.error = error.identifiable
            } receiveValue: { [weak self] animals in
                print(animals)
            }
            .store(in: &cancellables)
    }
}