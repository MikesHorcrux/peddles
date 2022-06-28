//
//  LocationManager.swift
//  peddles (iOS)
//
//  Created by Mike  Van Amburg on 6/25/22.
//

import Foundation
import CoreLocation
import MapKit

final class LocationManager: NSObject, ObservableObject {
    
    
    @Published var currentRegion = MKCoordinateRegion()
    @Published var usersLocation = CLLocation()
    @Published var invalidPermission: Bool = false
    private let manager = CLLocationManager()
    
    override init() {
        super.init()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        self.startLocation()
    }
    var isAuthorized: Bool {
        let status = manager.authorizationStatus
        #if os(iOS)
        return status == .authorizedAlways || status == .authorizedWhenInUse
        #endif
        
        #if os(macOS)
        return status == .authorizedAlways || status == .authorized
        #endif
    }
    
    var isUnAuthorized: Bool {
        let status = manager.authorizationStatus
        return status == .denied
    }
    
    var unDecidedAuthorization: Bool {
        let status = manager.authorizationStatus
        return status == .notDetermined
    }
    
    func startLocation() {
        if isAuthorized {
            manager.startUpdatingLocation()
        } else if isUnAuthorized {
            invalidPermission = true
        } else {
            manager.requestWhenInUseAuthorization()
        }
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if isAuthorized {
            manager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        guard let clError = error as? CLError else { return }
        
        switch clError {
        case CLError.denied:
            print("Access denied")
            startLocation()
        default:
            print("Catching location error: \(clError)")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        usersLocation = locations.last ?? .init()
        currentRegion = MKCoordinateRegion(center: usersLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
    }
}
