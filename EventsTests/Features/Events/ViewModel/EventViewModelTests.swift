//
//  EventViewModelTests.swift
//  EventsTests
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import XCTest
@testable import Events

class EventViewModelTests: XCTestCase {

    var model: Event?

    override func setUp() {
        let json: [String: Any] = [
            "id": "1",
            "title": "Event",
            "image": "image"
        ]

        if let data = try? JSONSerialization.data(withJSONObject: json) {
            model = try? JSONDecoder().decode(Event.self, from: data)
        }
    }

    func testPersonViewModels() {
        if let model = model {
            let viewModel = EventViewModel(event: model)

            let eventId = viewModel.eventId.value
            let title = viewModel.title.value
            let imageURL = viewModel.imageURL.value
            XCTAssertEqual(eventId, model.identifier)
            XCTAssertEqual(title, model.title)
            XCTAssertEqual(imageURL, model.imageURL)
        } else {
            XCTFail("Cloudn't load event")
        }
    }

}
