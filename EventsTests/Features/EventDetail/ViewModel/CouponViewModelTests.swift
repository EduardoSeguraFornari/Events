//
//  CouponViewModelTests.swift
//  EventsTests
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import XCTest
@testable import Events

class CouponViewModelTests: XCTestCase {

    var model: Coupon?

    override func setUp() {
        let json: [String: Any] = [
            "id": "1",
            "eventId": "1",
            "discount": 12
        ]

        if let data = try? JSONSerialization.data(withJSONObject: json) {
            model = try? JSONDecoder().decode(Coupon.self, from: data)
        }
    }

    func testPersonViewModels() {
        if let model = model {
            let viewModel = CouponViewModel(coupon: model)

            let discount = viewModel.discount.value
            let expectedValue = "\(model.discount)%"
            XCTAssertEqual(discount, expectedValue)
        } else {
            XCTFail("Cloudn't load event")
        }
    }

}
