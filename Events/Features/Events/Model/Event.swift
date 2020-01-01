//
//  Event.swift
//  Events
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import Foundation

struct Event: Codable {
    let identifier: String
    let title: String
    let imageURL: String

    // MARK: - Codable
    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case title
        case imageURL = "image"
    }

    // MARK: - Init
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        identifier = try container.decode(String.self, forKey: .identifier)
        title = try container.decode(String.self, forKey: .title)
        imageURL = try container.decode(String.self, forKey: .imageURL)
    }
}
