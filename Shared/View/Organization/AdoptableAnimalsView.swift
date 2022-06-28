//
//  AdoptableAnimalsView.swift
//  peddles
//
//  Created by Mike  Van Amburg on 6/27/22.
//

import SwiftUI

struct AdoptableAnimalsView: View {
    @ObservedObject var animalsViewModel: AnimalsViewModel
    let columns = [
           GridItem(.adaptive(minimum: 100))
       ]
    var body: some View {
        VStack {
            Text("Meet our adoptable peddles")
                .font(.headline)
                .padding()
            if !animalsViewModel.state.animals.isEmpty {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(animalsViewModel.state.animals) { item in
                            AnimalPhoto(img: item.photos.first?.full ?? "")
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(maxHeight: 400)
            } else {
                VStack{
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
