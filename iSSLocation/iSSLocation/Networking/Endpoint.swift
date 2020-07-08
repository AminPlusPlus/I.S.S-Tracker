//
//  Endpoint.swift
//  iSSLocation
//
//  Created by Aminjoni Abdullozoda on 6/22/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import Foundation

class Endpoint {
    
    static let baseURL = "http://api.open-notify.org/"
    
    enum ResourcePath : String {
        case location = "iss-now.json"
        case crew = "astros.json"
        
        var path : String {
            return baseURL + rawValue;
        }
    }
}
