//
//  CouponTests.swift
//  EventsTests
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import XCTest
@testable import Events

class CouponTests: XCTestCase {

    func testDecode() {
        let json: [String: Any] = [
            "id": "1",
            "eventId": "1",
            "discount": 12
        ]

        if let data = try? JSONSerialization.data(withJSONObject: json) {
            let model = try? JSONDecoder().decode(Coupon.self, from: data)
            XCTAssertTrue(model != nil)
        } else {
            XCTFail("Failed to serialize couponJson")
        }
    }

}
