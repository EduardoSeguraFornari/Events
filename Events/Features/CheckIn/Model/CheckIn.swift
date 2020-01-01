//
//  CheckIn.swift
//  Events
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import Foundation

struct CheckIn: Codable {
    let eventId: String
    let name: String
    let email: String

    // MARK: - Init
    init(eventId: String, name: String, email: String) {
        self.eventId = eventId
        self.name = name
        self.email = email
    }
}
