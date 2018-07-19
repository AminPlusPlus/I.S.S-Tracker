//
//  ISSLocation.swift
//  iSSLocation
//
//  Created by Aminjoni Abdullozoda on 7/19/18.
//  Copyright © 2018 Aminjoni Abdullozoda. All rights reserved.
//

import Foundation

struct ISSLocation : Codable
{
    let message: String
    let issPosition: IssPosition
    let timestamp: Int
    
    enum CodingKeys: String, CodingKey {
        case message
        case issPosition = "iss_position"
        case timestamp
    }
    
    //MARK: Just for showing in Console
    func getMessageLocation() -> String {
        
        return  "Message :\(message), Lat :\(issPosition.latitude), Lon: \(issPosition.longitude), TimeStamp: \(timestamp))"
    }
    
    //MARK: Unix to UTC
    func getUTCTime() -> Date
    {
        return Date(timeIntervalSince1970: TimeInterval(timestamp))
    }
}

struct IssPosition: Codable {
    let latitude, longitude: String
}


