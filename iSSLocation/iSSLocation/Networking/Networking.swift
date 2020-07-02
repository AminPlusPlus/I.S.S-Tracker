//
//  Networking.swift
//  iSSLocation
//
//  Created by Aminjoni Abdullozoda on 7/1/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import Foundation
import Combine
enum APIError: Error, LocalizedError {
    case unknown, apiError(reason: String)

    var errorDescription: String? {
        switch self {
        case .unknown:
            return "Unknown error"
        case .apiError(let reason):
            return reason
        }
    }
}

struct Response<T> {
    let value: T
    let response: URLResponse
}

class Networking {
        
    static func run<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response<T>, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { result -> Response<T> in
                let value = try decoder.decode(T.self, from: result.data) 
                return Response(value: value, response: result.response)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
