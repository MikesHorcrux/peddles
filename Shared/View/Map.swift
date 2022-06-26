//
//  Map.swift
//  peddles (iOS)
//
//  Created by Mike  Van Amburg on 6/25/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject var location = LocationManager()
    @State var region = MKCoordinateRegion()
    var body: some View {
        Map(coordinateRegion: $location.currentRegion, interactionModes: .all, showsUserLocation: true, userTrackingMode: .constant(.follow))
    }
}

struct Map_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
