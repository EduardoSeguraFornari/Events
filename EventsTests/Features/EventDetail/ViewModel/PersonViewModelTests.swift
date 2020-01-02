//
//  PersonViewModelTests.swift
//  EventsTests
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import XCTest
@testable import Events

class PersonViewModelTests: XCTestCase {

    var model: Person?

    override func setUp() {
        let json: [String: Any] = [
            "id": "1", "eventId": "1",
            "name": "John",
            "picture": "picture"
        ]

        if let data = try? JSONSerialization.data(withJSONObject: json) {
            model = try? JSONDecoder().decode(Person.self, from: data)
        }
    }

    func testPersonViewModels() {
        if let model = model {
            let viewModel = PersonViewModel(person: model)

            let name = viewModel.name.value
            let pictureURL = viewModel.pictureURL.value
            XCTAssertEqual(name, model.name)
            XCTAssertEqual(pictureURL, model.pictureURL)
        } else {
            XCTFail("Cloudn't load event")
        }
    }

}
