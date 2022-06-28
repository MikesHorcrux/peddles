//
//  MapState.swift
//  peddles
//
//  Created by Mike  Van Amburg on 6/25/22.
//

import Foundation

struct MapState: Equatable {
    static func == (lhs: MapState, rhs: MapState) -> Bool {
        return true
    }

    var error: IdentifiableError?
    var organizationAnnotations: [AnnotationModel] = []
    var organizations: Organizations?
}
