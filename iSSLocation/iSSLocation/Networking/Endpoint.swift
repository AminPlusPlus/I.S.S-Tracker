//
//  Endpoint.swift
//  iSSLocation
//
//  Created by Aminjoni Abdullozoda on 6/22/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import Foundation

//https://newsapi.org/v2/top-headlines?q=space&apiKey=c647e26e297144e7912b256d62134180
class Endpoint {
    
    static let baseURL = "http://api.open-notify.org/"
    static let baseNewsURL = "https://newsapi.org/v2/"
    
    private static let newsToken = "c647e26e297144e7912b256d62134180"
    
    enum ResourcePath : String {
        case location = "iss-now.json"
        case crew = "astros.json"
        case headlineSpaceNews = "top-headlines?q=space"
        
        var path : String {
           
            if self == .headlineSpaceNews {
                return baseNewsURL + rawValue + "&apiKey="+newsToken
            }
            return baseURL + rawValue;
        }
    }
}

