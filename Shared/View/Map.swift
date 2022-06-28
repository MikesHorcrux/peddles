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
    @State private var region: MKCoordinateRegion = .init()
    var body: some View {
        
        Map(
            coordinateRegion: $region,
            interactionModes: .all,
            showsUserLocation: true,
            userTrackingMode: $trackingMode,
            annotationItems: viewModel.state.organizationAnnotations
        ) { item in
            MapAnnotation(coordinate: item.latlong) {
                NavigationLink(destination: {
                    OrganizationView(orgId: item.id)
                }, label: {
                    annotationImage(img: item.img)
                    
                })
                .buttonStyle(.plain)
            }
        }
        .onAppear {
            region = location.currentRegion
        }
        
    }
    private func annotationImage(img: String) -> some View {
        AsyncImage(url: URL(string: img)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            Image(systemName: "photo")
                .imageScale(.large)
                .foregroundColor(.gray)
        }
        .overlay(
            Circle().stroke(Color.white, lineWidth: 8)
        )
        .clipShape(Circle())
        .frame(width: 60, height: 60)
    }
}

#if DEBUG
struct Map_Previews: PreviewProvider {
    static var previews: some View {
        MapView(location: LocationManager(), viewModel: MapViewModel(client: InMemoryAPIClient()))
    }
}
#endif
