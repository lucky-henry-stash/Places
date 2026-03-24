//
//  FormValidator.swift
//  Places
//
//  Created by henry on 3/24/26.
//
import Foundation
enum FormError: LocalizedError {
    case invalidLatitude
    case invalidLongitude
    case missingLatitude
    case missingLongitude
    
    var errorDescription: String {
        switch self {
        case .invalidLatitude:
            return "Latitude must be between -90 and 90"
        case .invalidLongitude:
            return "Latitude must be between -180 and 180"
        case .missingLatitude:
            return "Latitude is a required field"
        case .missingLongitude:
            return "Longitude is a required field"
        }
    }
}
class FormValidator {
    enum FormError: Error {
        case invalidInput
        case missingLatitude
        case missingLongitude
    }
        
    func validate(longitude: String?, latitude: String?) throws -> Bool {
        guard let longitude = longitude, !longitude.isEmpty else {
            throw FormError.missingLongitude
        }
        
        guard let latitude = latitude, !latitude.isEmpty else {
            throw FormError.missingLatitude
        }
        
        guard let long = Double(longitude) else {
            throw FormError.invalidInput
        }
        
        guard let lat = Double(latitude) else {
            throw FormError.invalidInput
        }
        
        
        if abs(long) > 180 {
            throw FormError.invalidInput
        }
        
        if abs(lat) > 90 {
            throw FormError.invalidInput
        }
        return true
    }
}



