//
//  ApiResult.swift
//  RandomUser
//
//  Created by Eric Terrisson on 16/05/2024.
//

import Foundation

/// Api Result
struct ApiResult: Codable {
    let results: [User]
    let info: Info
}

struct User: Codable, Identifiable {
    let id = UUID()
    let gender: String
    let name: Name
    let location: Location
    let picture: Picture
}

struct Name: Codable {
    let title: String
    let first: String
    let last: String
    
    var description: String {
        return "\(title) \(first) \(last)"
    }
}

struct Location: Codable {
    let street: Street
    let city: String
    let state: String
    let country: String
    let postcode: Postcode
    let coordinates: Coordinates
    let timezone: Timezone
    
    var fullAddress: String {
        return "\(street.number), \(street.name) - \(city)"
    }
}

struct Street: Codable {
    let number: Int
    let name: String
}

struct Coordinates: Codable {
    let latitude: String
    let longitude: String
}

struct Timezone: Codable {
    let offset: String
    let description: String
}

struct Picture: Codable {
    let large: String
    let medium: String
    let thumbnail: String
}

struct Info: Codable {
    let seed: String
    let results: Int
    let page: Int
    let version: String
}

// Postcode can be a string or an int but always returned as a string
struct Postcode: Codable {
    let value: String

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let intValue = try? container.decode(Int.self) {
            self.value = String(intValue)
        } else if let stringValue = try? container.decode(String.self) {
            self.value = stringValue
        } else {
            throw DecodingError.typeMismatch(Postcode.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Cannot decode postcode"))
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
