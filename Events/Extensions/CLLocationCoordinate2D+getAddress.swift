//
//  CLLocationCoordinate2D+getAddress.swift
//
//  Copyright © 2019 Eduardo Fornari. All rights reserved.
//

import CoreLocation

struct CLAddress {
    let country: String?
    let locality: String?
    let subLocality: String?
    let thoroughfare: String?
    let subThoroughfare: String?
    let postalCode: String?

    var description: String {
        var result = ""

        if let country = country {
            result.append(country)
        }
        if let locality = locality {
            result.append(result.isEmpty ? locality : ", \(locality)")
        }
        if let subLocality = subLocality {
            result.append(result.isEmpty ? subLocality : ", \(subLocality)")
        }
        if let thoroughfare = thoroughfare {
            result.append(result.isEmpty ? thoroughfare : ", \(thoroughfare)")
        }
        if let subThoroughfare = subThoroughfare {
            result.append(result.isEmpty ? subThoroughfare : ", \(subThoroughfare)")
        }
        if let postalCode = postalCode {
            result.append(result.isEmpty ? postalCode : ", \(postalCode)")
        }

        return result
    }
}

extension CLLocationCoordinate2D {

    func getAddress(complation: @escaping (CLAddress?, Error?) -> Void) {
        let geocoder: CLGeocoder = CLGeocoder()
        let location: CLLocation = CLLocation(latitude: self.latitude, longitude: self.longitude)

        geocoder.reverseGeocodeLocation(location, completionHandler: { placemarks, error in
            let address: CLAddress?
            if let placemark = placemarks?.first {
                address = CLAddress(country: placemark.country, locality: placemark.locality,
                subLocality: placemark.subLocality, thoroughfare: placemark.thoroughfare,
                subThoroughfare: placemark.subThoroughfare, postalCode: placemark.postalCode)
            } else {
                address = nil
            }
            complation(address, error)
        })
    }

}
