//
//  Animal.swift
//  peddles (iOS)
//
//  Created by Mike  Van Amburg on 6/25/22.
//

import Foundation

struct Animal: Codable {
    var id: Int
    var organizationId: String
    var url: String
    var type: String
    var species: String
    var breeds: AnimalBreeds
    var colors: AnimalColors
    var age: String
    var gender: String
    var size: String
    var coat: String?
    var name: String
    var description: String?
    var photos: [Photos]
    var status: String
    var attributes: AnimalAttributes
    var environment: AnimalEnvironment
    var tags: [String]
    var contact: AnimalContact
}

#if DEBUG
extension Animal {
    static func create(
        id: Int = 123,
        organizationId: String = "NJ33",
        url: String = "https://www.petfinder.com/cat/nebula-124/nj/jersey-city/nj333-petfinder-test-account/?referrer_id=d7e3700b-2e07-11e9-b3f3-0800275f82b1",
        type: String = "cat",
        species: String = "cat",
        breeds: AnimalBreeds = .create(),
        colors: AnimalColors = .create(),
        age: String = "Young",
        gender: String = "Female",
        size: String = "medium",
        coat: String = "short",
        name: String = "Nebula",
        description: String = "Nebula is a shorthaired, shy cat. She is very affectionate once she warms up to you.",
        photos: [Photos] = [.create()],
        status: String = "adoptable",
        attributes: AnimalAttributes = .create(),
        environment: AnimalEnvironment = .create(),
        tags: [String] = [
            "Cute",
            "Intelligent",
            "Playful",
            "Happy",
            "Affectionate"
        ],
        contact: AnimalContact = .create()
    ) -> Self{
        Self(id: id, organizationId: organizationId, url: url, type: type, species: species, breeds: breeds, colors: colors, age: age, gender: gender, size: size, coat: coat, name: name, description: description, photos: photos, status: status, attributes: attributes, environment: environment, tags: tags, contact: contact)
    }
}
#endif
