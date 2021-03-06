//
//  CheckInTests.swift
//  EventsTests
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import XCTest
@testable import Events

class CheckInTests: XCTestCase {

    func testEncodeDecode() {
        let checkIn = ""//CheckIn(eventId: "1", name: "John", email: "john@john.com")
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(checkIn) {
            let model = try? JSONDecoder().decode(CheckIn.self, from: data)
            XCTAssertTrue(model != nil)
        } else {
            XCTFail("Failed to serialize checkIn")
        }
    }

}
