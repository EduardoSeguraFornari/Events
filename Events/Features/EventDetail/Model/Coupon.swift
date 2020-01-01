//
//  Coupon.swift
//  Events
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import Foundation

struct Coupon: Codable {
    let identifier: String
    let eventId: String
    let discount: Int

    // MARK: - Codable
    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case eventId
        case discount
    }
}
