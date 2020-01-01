//
//  EventsApiGetEndpointTests.swift
//  EventsTests
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import XCTest
@testable import Events

class EventsApiGetEndpointTests: XCTestCase {

    let httpMethod = "GET"

    func testEvents() {
        let endpoint = EventsApiGetEndpoint.events
        let request = endpoint.makeRequest()
        if let request = request {
            XCTAssertEqual(request.httpMethod, httpMethod)
            XCTAssertEqual(request.url?.absoluteString, EventsApiGetEndpoint.baseUrl + endpoint.path)
            XCTAssertNotNil(request.allHTTPHeaderFields)
            XCTAssertEqual(request.allHTTPHeaderFields?.count, 1)
        } else {
            XCTFail("Couldn't build request.")
        }
    }

    func testEvent() {
        let endpoint = EventsApiGetEndpoint.event(identifier: "1")
        let request = endpoint.makeRequest()
        if let request = request {
            XCTAssertEqual(request.httpMethod, httpMethod)
            XCTAssertEqual(request.url?.absoluteString, EventsApiGetEndpoint.baseUrl + endpoint.path)
            XCTAssertNotNil(request.allHTTPHeaderFields)
            XCTAssertEqual(request.allHTTPHeaderFields?.count, 1)
        } else {
            XCTFail("Couldn't build request.")
        }
    }

}
