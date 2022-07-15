//
//  ContentView.swift
//  Shared
//
//  Created by Mike  Van Amburg on 6/23/22.
//

import SwiftUI
import BottomSheet

struct ContentView: View {
    @StateObject var viewModel = MapViewModel(client: DefaultAPIClient.shared)
    @StateObject var animalsVM = AnimalsViewModel(client: DefaultAPIClient.shared)
    @StateObject var location = LocationManager()
    @State private var showSheet: Bool = false

    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                MapView(location: location, viewModel: viewModel)
                    .edgesIgnoringSafeArea(.all)
                Text("peddles")
                    .foregroundColor(.teal)
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding(.top, -55)

            }
            .bottomSheet(isPresented: $showSheet, height: 800) {
                AdoptableAnimalsView(animalsViewModel: animalsVM)
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button {
                showSheet.toggle()
            } label: {
                ZStack {
                    Capsule()
                        .frame(width: 105, height: 45)
                        .foregroundColor(.secondary)
                    Text("Find Pets 🐶")
                        .foregroundColor(.primary)
                    
                }
            })
            // Todo: put this in the view model and use somthing beter than a timer
            .onReceive(timer) { _ in
                if viewModel.token != nil {
                    if !viewModel.state.organizationAnnotations.isEmpty {
                        timer.upstream.connect().cancel()
                    } else {
                        viewModel.fetchOrgsInArea(longLat: "\(location.currentRegion.center.latitude), \(location.currentRegion.center.longitude)")
                        animalsVM.fetchAnimals(zipcode: "\(location.currentRegion.center.latitude), \(location.currentRegion.center.longitude)")
                    }
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
