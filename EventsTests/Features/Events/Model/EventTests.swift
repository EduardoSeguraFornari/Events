//
//  EventTests.swift
//  EventsTests
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import XCTest
@testable import Events

class EventTests: XCTestCase {

    func testDecode() {
        let json: [String: Any] = [
            "id": "1",
            "title": "Event",
            "image": "image"
        ]

        if let data = try? JSONSerialization.data(withJSONObject: json) {
            let model = try? JSONDecoder().decode(Event.self, from: data)
            XCTAssertTrue(model != nil)
        } else {
            XCTFail("Failed to serialize eventJson")
        }
    }

}
