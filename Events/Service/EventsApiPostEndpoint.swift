//
//  EventsApiPostEndpoint.swift
//  Events
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import Foundation

enum EventsApiPostEndpoint {
    case checkin(CheckIn)
}

extension EventsApiPostEndpoint {
    static let baseUrl = "https://5b840ba5db24a100142dcd8c.mockapi.io"

    var path: String {
        switch self {
        case .checkin:
            return "/api/checkin"
        }
    }

    private var headers: [String: String] {
        switch self {
        case .checkin:
            return ["Content-Type": "Application/json"]
        }
    }

    private var body: Data? {
        switch self {
        case .checkin(let checkin):
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let data = try? encoder.encode(checkin)

            return data
        }
    }

    func makeRequest() -> URLRequest? {
        guard let url = URL(string: EventsApiPostEndpoint.baseUrl + path) else {
            return nil
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body

        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }

        return request
    }
}
