//
//  MKMapView+routes.swift
//
//  Copyright © 2019 Eduardo Fornari. All rights reserved.
//

import MapKit

extension MKMapView {

    func requestRoutes(from source: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D,
                       completion: @escaping ([MKRoute]?, Error?) -> Void) {
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: source, addressDictionary: nil))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination, addressDictionary: nil))
        request.requestsAlternateRoutes = true
        request.transportType = .automobile

        let directions = MKDirections(request: request)

        directions.calculate { response, error in
            let routes = response?.routes
            completion(routes, error)
        }
    }

    func drawRoutes(_ routes: [MKRoute]) {
        self.removeOverlays(self.overlays)
        for route in routes {
            self.addOverlay(route.polyline)
            self.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
        }
    }
}
