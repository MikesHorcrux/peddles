//
//  Map.swift
//  peddles (iOS)
//
//  Created by Mike  Van Amburg on 6/25/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var location: LocationManager
    @ObservedObject var viewModel: MapViewModel
    @State private var trackingMode = MapUserTrackingMode.follow
    var body: some View {
       
        Map(
            coordinateRegion: $location.currentRegion,
            interactionModes: .all,
            showsUserLocation: true,
            userTrackingMode: $trackingMode,
            annotationItems: viewModel.state.organizationAnnotations
        ) { item in
            MapPin(coordinate: item.latlong)
//            MapAnnotation(coordinate: item.latlong) {
//                VStack {
//
//                        NavigationLink(destination: Text("org page")) {
//                            Text(item.id)
//                        }
//
//                }
//            }
        }
       
        }
    

}

#if DEBUG
struct Map_Previews: PreviewProvider {
    static var previews: some View {
        MapView(location: LocationManager(), viewModel: MapViewModel(client: InMemoryAPIClient()))
    }
}
#endif
