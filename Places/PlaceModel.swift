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
    
    lazy var url: URL? = {
        guard var components = URLComponents(string: "wikipedia://places") else { return nil }
        components.queryItems = [
            URLQueryItem(name: "longitude", value: long.description),
            URLQueryItem(name: "longitude", value: lat.description),
            URLQueryItem(name: "name", value: name ?? "Untitled")
        ]
        return components.url
    }()
}
