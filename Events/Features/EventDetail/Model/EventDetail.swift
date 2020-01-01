//
//  EventDetail.swift
//  Events
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import Foundation

struct EventDetail: Codable {
    let identifier: String
    let title: String
    let price: Double
    let latitude: Double
    let longitude: Double
    let imageURL: String
    let eventDescription: String
    private let dateInterval: Double
    var date: Date {
        return Date(timeIntervalSince1970: dateInterval)
    }
    let people: [Person]
    let coupons: [Coupon]

    // MARK: - Codable
    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case title
        case price
        case latitude
        case longitude
        case imageURL = "image"
        case eventDescription = "description"
        case dateInterval = "date"
        case people
        case coupons = "cupons"
    }

}
