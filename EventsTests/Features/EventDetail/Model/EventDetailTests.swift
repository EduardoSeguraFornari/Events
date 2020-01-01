//
//  EventDetailTests.swift
//  EventsTests
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import Foundation

import XCTest
@testable import Events

class EventDetailTests: XCTestCase {

    func testDecode() {
        let model: [String: Any] = [
            "id": "1",
            "title": "Event",
            "price": 10,
            "latitude": 0,
            "longitude": 0,
            "image": "image",
            "description": "description",
            "date": 0,
            "people": [
                ["id": "1", "eventId": "1", "name": "John", "picture": "picture"],
                ["id": "2", "eventId": "1", "name": "Bryan", "picture": "picture"]
            ],
            "cupons": [["id": "1", "eventId": "1", "discount": 12]]
        ]

        if let data = try? JSONSerialization.data(withJSONObject: model) {
            let model = try? JSONDecoder().decode(EventDetail.self, from: data)
            XCTAssertTrue(model != nil)
        } else {
            XCTFail("Failed to serialize eventJson")
        }
    }

}
