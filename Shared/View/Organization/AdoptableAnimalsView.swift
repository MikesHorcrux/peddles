//
//  AdoptableAnimalsView.swift
//  peddles
//
//  Created by Mike  Van Amburg on 6/27/22.
//

import SwiftUI

struct AdoptableAnimalsView: View {
    @StateObject var animalsViewModel: AnimalsViewModel
    var body: some View {
        VStack {
            Text("Meet our adoptable peddles")
                .font(.headline)
                .padding()
            if !animalsViewModel.state.animals.isEmpty {
                ScrollView {
                    ForEach(animalsViewModel.state.animals) { animal in
                        if let animal = animal {
                            NavigationLink {
                                AnimalView(viewModel: animalsViewModel, animalId: animal.id)
                            } label: {
                                AnimalCard(
                                    img: animal.photos.first?.medium ?? "",
                                    name: animal.name ,
                                    breed: animal.breeds.primary ,
                                    animalType: animal.type ,
                                    color: animal.colors.primary ?? "",
                                    description: animal.description ?? "")
                            }

                        }
                    }
                }
            } else {
                VStack {
                    Text("sorry all of our animals have homes")
                    Text("🐶🐰🐱")
                }
                .padding()
                .font(.title)
                .frame(height: 400)
            }

        }
    }
}

#if DEBUG
struct AdoptableAnimalsView_Previews: PreviewProvider {

    static var previews: some View {
        let viewModel = AnimalsViewModel(client: InMemoryAPIClient())
        AdoptableAnimalsView(animalsViewModel: viewModel)
    }
}
#endif
