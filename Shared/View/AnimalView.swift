//
//  AnimalView.swift
//  peddles
//
//  Created by Mike  Van Amburg on 7/7/22.
//

import SwiftUI

struct AnimalView: View {
    @ObservedObject var viewModel: AnimalsViewModel
    var animalId: String
    var body: some View {
        ScrollView{
            HStack {
                animalImg
                VStack(alignment: .leading){
                    HStack {
                        Text("name:")
                        Spacer()
                        Text(viewModel.state.animal?.name ?? "")
                            .bold()
                    }
                    HStack {
                        Text("type: ")
                        Spacer()
                        Text(viewModel.state.animal?.type ?? "")
                            .bold()
                    }
                    HStack {
                        Text("color: ")
                        Spacer()
                        Text(viewModel.state.animal?.colors.primary ?? "")
                            .bold()
                    }
                    HStack {
                        Text("age: ")
                        Spacer()
                        Text(viewModel.state.animal?.age ?? "")
                            .bold()
                    }
                    HStack {
                        Text("gender: ")
                        Spacer()
                        Text(viewModel.state.animal?.gender ?? "")
                            .bold()
                    }
                    HStack {
                        Text("size: ")
                        Spacer()
                        Text(viewModel.state.animal?.size ?? "")
                            .bold()
                    }
                }
                .padding()
            }
            .padding()
            
            Text(viewModel.state.animal?.description ?? "")
                .padding()
        }
        .onAppear{
            viewModel.fetchAnimal(id: animalID)
        }
    }
    
    private var animalImg: some View{
        AsyncImage(url: URL(string: viewModel.state.animal?.photos.first?.full ?? "")) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            Image(systemName: "photo")
                .imageScale(.large)
                .background(Color.gray)
                .frame(width: 140, height: 140)
        }
        .background(Color.gray)
        .frame(width: 140, height: 140)
        .clipShape(Circle())
    }
}

#if DEBUG
struct AnimalView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AnimalsViewModel(client: InMemoryAPIClient())
        AnimalView(viewModel: viewModel, animalId: "")
            .onAppear{
                viewModel.state.animal = .create()
            }
    }
}
#endif
