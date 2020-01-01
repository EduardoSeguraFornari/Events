//
//  PersonTests.swift
//  EventsTests
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import XCTest
@testable import Events

class PersonTests: XCTestCase {

    func testDecode() {
        let json: [String: Any] = [
            "id": "1", "eventId": "1",
            "name": "John",
            "picture": "picture"
        ]

        if let data = try? JSONSerialization.data(withJSONObject: json) {
            let model = try? JSONDecoder().decode(Person.self, from: data)
            XCTAssertTrue(model != nil)
        } else {
            XCTFail("Failed to serialize personJson")
        }
    }

}
