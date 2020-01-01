//
//  EventsApiError.swift
//  Events
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import Foundation

enum EventsApiError: Error {
    case custom(String)
}

extension EventsApiError {
    static var makeRequest: EventsApiError {
        return EventsApiError.custom("Couldn't create request.")
    }

    static var decode: EventsApiError {
        return EventsApiError.custom("Couldn't decode data.")
    }
}
