//
//  AnnotationModel.swift
//  peddles (iOS)
//
//  Created by Mike  Van Amburg on 6/25/22.
//

import Foundation
import CoreLocation

struct AnnotationModel: Identifiable {
    var id: String
    var img: String
    var latlong: CLLocationCoordinate2D
}
