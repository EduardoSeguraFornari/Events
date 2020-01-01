//
//  Person.swift
//  Events
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import Foundation

struct Person: Codable {
    let identifier: String
    let eventId: String
    let name: String
    let pictureURL: String

    // MARK: - Codable
    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case eventId
        case name
        case pictureURL = "picture"
    }
}
