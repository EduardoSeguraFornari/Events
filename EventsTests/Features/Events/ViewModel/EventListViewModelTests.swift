//
//  EventListViewModelTests.swift
//  EventsTests
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import XCTest
@testable import Events

class EventListViewModelTests: XCTestCase {

    var events: [Event]?

    override func setUp() {
        let json: [[String: Any]] = [
            [
                "id": "1",
                "title": "Event 1",
                "image": "image"
            ],
            [
                "id": "1",
                "title": "Event 2",
                "image": "image"
            ],
            [
                "id": "1",
                "title": "Event 3",
                "image": "image"
            ]
        ]

        if let data = try? JSONSerialization.data(withJSONObject: json) {
            events = try? JSONDecoder().decode([Event].self, from: data)
        }
    }

    func testGetModel() {
        if let events = events {
            let eventListViewModel = EventListViewModel()
            let eventsViewModels = events.compactMap { event -> EventViewModel? in
                return EventViewModel(event: event)
            }
            eventListViewModel.eventsDataSource.updateItems(eventsViewModels)
            
            let eventViewModel0 = eventListViewModel.model(at: 0)
            let eventViewModel1 = eventListViewModel.model(at: 1)
            let eventViewModel2 = eventListViewModel.model(at: 2)

            let event0 = events[0]
            let event1 = events[1]
            let event2 = events[2]

            XCTAssertEqual(eventViewModel0.title.value, event0.title)
            XCTAssertEqual(eventViewModel1.title.value, event1.title)
            XCTAssertEqual(eventViewModel2.title.value, event2.title)
        } else {
            XCTFail("Cloudn't load events")
        }
    }

}
