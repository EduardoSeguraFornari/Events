//
//  EventsApiGetEndpoint.swift
//  Events
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import Foundation

enum EventsApiGetEndpoint {
    case events
    case event(identifier: String)
}

extension EventsApiGetEndpoint {
    static let baseUrl = "https://5b840ba5db24a100142dcd8c.mockapi.io"

    var path: String {
        switch self {
        case .events:
            return "/api/events"
        case .event(let identifier):
            return "/api/events/\(identifier)"
        }
    }

    var headers: [String: String] {
        switch self {
        case .events, .event:
            return ["Content-Type": "Application/json"]
        }
    }

    func makeRequest() -> URLRequest? {
        guard let url = URL(string: EventsApiGetEndpoint.baseUrl + path) else {
            return nil
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }

        return request
    }

}
