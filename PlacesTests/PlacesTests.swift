//
//  PlacesTests.swift
//  PlacesTests
//
//  Created by henry on 3/24/26.
//

import XCTest
@testable import Places
extension URL {
    func valueOf(_ queryParameterName: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParameterName })?.value
    }
}
final class PlacesTests: XCTestCase {
    
    func testPlaceURL() throws {
        let expectedLat = 40.7143
        let expectedLong = -74.006
        let place = Place(name: "New York City", lat: expectedLat, long: expectedLong)
        guard let url = place.url else {
            XCTFail("URL for \(place) is nil")
            return
        }
        if let lat = url.valueOf("lat"){
            XCTAssertEqual(Double(lat), expectedLat)
        } else {
            XCTFail("lat query param is nil")
        }
        if let long = url.valueOf("long"){
            XCTAssertEqual(Double(long), expectedLong)
        } else {
            XCTFail("long query param is nil")
        }
    }
}
