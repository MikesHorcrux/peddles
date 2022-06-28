//
//  AnimalsViewModel.swift
//  peddles (iOS)
//
//  Created by Mike  Van Amburg on 6/25/22.
//

import Foundation
import Combine

class AnimalsViewModel: ObservableObject {
    @Published var state = AnimalState()

    private let client: APIClient
    private var cancellables = Set<AnyCancellable>()

    init(client: APIClient) {
        self.client = client
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
                // todo: add error handling
                self?.state.error = error.identifiable
            } receiveValue: { [weak self] animals in
                self?.state.animals = animals.animals
            }
            .store(in: &cancellables)
    }

    func fetchAnimalsByOrg(id: String) {
        client
            .dispatch(GetAnimals(queryParams:
                                    [
                                        "organization": id,
                                        "limit": "30"
                                    ]))
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard case .failure(let error) = completion else {
                    return
                }
                // todo: add error handling
                self?.state.error = error.identifiable
                print(error.identifiable)
            } receiveValue: { [weak self] animals in
                self?.state.animals = animals.animals
            }
            .store(in: &cancellables)
    }
}
