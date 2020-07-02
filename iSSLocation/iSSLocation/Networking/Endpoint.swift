//
//  Endpoint.swift
//  iSSLocation
//
//  Created by Aminjoni Abdullozoda on 6/22/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import Foundation

enum Endpoint {
    case crew
    case location
}


private extension URL {
    static func makeForEndpoint(_ endpoint: String) -> URL {
        URL(string: "http://api.open-notify.org/\(endpoint)")!
    }
}

extension Endpoint {
    var url: URL {
        switch self {
        case .crew:
            return .makeForEndpoint("astros.json")
        case .location:
            return .makeForEndpoint("iss-now.json")
    }
}
}
