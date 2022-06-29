//
//  ContentView.swift
//  Shared
//
//  Created by Mike  Van Amburg on 6/23/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = MapViewModel(client: DefaultAPIClient.shared)
    @StateObject var animalsVM = AnimalsViewModel(client: DefaultAPIClient.shared)
    @StateObject var location = LocationManager()

    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationView {
            ZStack {
                MapView(location: location, viewModel: viewModel)
                    .edgesIgnoringSafeArea(.all)
            }
            // Todo: put this in the view model and use somthing beter than a timer
            .onReceive(timer) { _ in
                if viewModel.token != nil {
                    if !viewModel.state.organizationAnnotations.isEmpty {
                        timer.upstream.connect().cancel()
                    } else {
                        viewModel.fetchOrgsInArea(longLat: "\(location.currentRegion.center.latitude), \(location.currentRegion.center.longitude)")
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
