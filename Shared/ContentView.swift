//
//  ContentView.swift
//  Shared
//
//  Created by Mike  Van Amburg on 6/23/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = MapViewModel(client: DefaultAPIClient.shared)
    @StateObject var animalsVM = AnimalsViewModel(client: DefaultAPIClient.shared)
    @StateObject var location = LocationManager()
    var body: some View {
        ZStack {
            MapView(location: location)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Hello, peddles Lets do this!")
                    .padding()
                Button("animals") {
                    //animalsVM.fetchAnimals()
                    viewModel.fetchOrgsInArea(zipCode: "78653")
                }
                
                
            }
        }
           
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
