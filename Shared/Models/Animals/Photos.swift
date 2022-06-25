//
//  AnimalPhotos.swift
//  peddles (iOS)
//
//  Created by Mike  Van Amburg on 6/25/22.
//

import Foundation

struct Photos: Codable{
    var small: String
    var medium: String
    var large: String
    var full: String
}

#if DEBUG
extension Photos {
    static func create (
        small: String = "https://photos.petfinder.com/photos/pets/124/1/?bust=1546042081&width=100",
        medium: String = "https://photos.petfinder.com/photos/pets/124/1/?bust=1546042081&width=300",
        large: String = "https://photos.petfinder.com/photos/pets/124/1/?bust=1546042081&width=600",
        full: String = "https://photos.petfinder.com/photos/pets/124/1/?bust=1546042081"
    ) -> Self{
        Self(small: small, medium: medium, large: large, full: full)
    }
}
#endif
