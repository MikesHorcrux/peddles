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
    @State private var trackingMode = MapUserTrackingMode.follow
    var body: some View {
        Map(
            coordinateRegion: $location.currentRegion,
            interactionModes: .all,
            showsUserLocation: true,
            userTrackingMode: $trackingMode)
    }
}

#if DEBUG
struct Map_Previews: PreviewProvider {
    static var previews: some View {
        MapView(location: LocationManager())
    }
}
#endif
