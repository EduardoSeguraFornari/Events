//
//  EventsApiPostEndpointTests.swift
//  EventsTests
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import XCTest
@testable import Events

class EventsApiPostEndpointTests: XCTestCase {

    let httpMethod = "POST"

    func testCheckIn() {
        let checkIn = CheckIn(eventId: "1", name: "John", email: "john@john.com")
        let endpoint = EventsApiPostEndpoint.checkin(checkIn)
        let request = endpoint.makeRequest()
        if let request = request {
            XCTAssertEqual(request.httpMethod, httpMethod)
            XCTAssertNotNil(request.httpBody)
            XCTAssertEqual(request.url?.absoluteString, EventsApiPostEndpoint.baseUrl + endpoint.path)
            XCTAssertNotNil(request.allHTTPHeaderFields)
            XCTAssertEqual(request.allHTTPHeaderFields?.count, 1)
        } else {
            XCTFail("Couldn't build request.")
        }
    }

}
