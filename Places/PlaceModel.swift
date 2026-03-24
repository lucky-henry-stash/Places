//
//  PlaceModel.swift
//  Places
//
//  Created by henry on 3/24/26.
//
import Foundation
struct Locations: Decodable {
    let locations: [Place]
}
struct Place: Decodable, Identifiable {
    var id: String { "\(long), \(lat)"}
    let name: String?
    let lat: Double
    let long: Double
    
    var url: URL? {
        guard var components = URLComponents(string: "wikipedia://places") else { return nil }
        components.queryItems = [
            URLQueryItem(name: "long", value: long.description),
            URLQueryItem(name: "lat", value: lat.description),
        ]
        return components.url
    }
}
