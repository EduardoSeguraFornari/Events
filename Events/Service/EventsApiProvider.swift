//
//  EventsApiProvider.swift
//  Events
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import Foundation

final class EventsApiProvider {
    let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func request<T: Decodable>(for endpoint: EventsApiGetEndpoint,
                               completion: @escaping (Result<T, Error>) -> Void) {

        if let request = endpoint.makeRequest() {
            session.dataTask(with: request) { (data, _, error) in
                if let error = error {
                    completion(.failure(error))
                } else if let data = data {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .millisecondsSince1970
                    if let model = try? jsonDecoder.decode(T.self, from: data) {
                        completion(.success(model))
                    } else {
                        let error = EventsApiError.decode
                        completion(.failure(error))
                    }
                }
            }.resume()
        } else {
            let error = EventsApiError.makeRequest
            completion(.failure(error))
        }
    }

    func request(for endpoint: EventsApiPostEndpoint,
                 completion: @escaping (Result<Void, Error>) -> Void) {

        if let request = endpoint.makeRequest() {
            session.dataTask(with: request) { (_, _, error) in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(()))
                }
            }.resume()
        } else {
            let error = EventsApiError.makeRequest
            completion(.failure(error))
        }
    }

}
