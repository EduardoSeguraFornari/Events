//
//  MKMapView+ZoomOutForLocations.swift
//
//  Copyright © 2019 Eduardo Fornari. All rights reserved.
//

import MapKit

extension MKMapView {
    func zoomOut(for locations: [CLLocationCoordinate2D]) {
        var zoomRect = MKMapRect.null
        for location in locations {
            let point = MKMapPoint(location)
            let pointRect = MKMapRect(x: point.x, y: point.y, width: 0, height: 0)
            if zoomRect.isNull {
                zoomRect = pointRect
            } else {
                zoomRect = zoomRect.union(pointRect)
            }
        }
        setVisibleMapRect(zoomRect, edgePadding: UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40),
                          animated: true)
        layoutIfNeeded()
    }
}
