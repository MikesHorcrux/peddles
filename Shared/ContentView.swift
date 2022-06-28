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
    
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    @State var count = 1
    var body: some View {
        NavigationView{
            ZStack {
                MapView(location: location, viewModel: viewModel)
                    .edgesIgnoringSafeArea(.all)
                Text("\(count)")
                
            }
            .onReceive(timer) { time in
                if viewModel.token != nil{
                    if !viewModel.state.organizationAnnotations.isEmpty{
                        timer.upstream.connect().cancel()
                    }else{
                        viewModel.fetchOrgsInArea(zipCode:"\(location.currentRegion.center.latitude), \(location.currentRegion.center.longitude)")
                    }
                }
            }
        }
        .navigationViewStyle(.automatic)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
