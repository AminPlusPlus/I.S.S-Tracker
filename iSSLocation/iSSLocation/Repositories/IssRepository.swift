//
//  IssRepository.swift
//  iSSLocation
//
//  Created by Aminjoni Abdullozoda on 7/1/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import Foundation
import Combine

class IssRepository {
    
    static func requestLocationISS (completionHandler : @escaping (Result<ISSLocation,APIError>) -> Void ) {
    
         Networking.request(url: Endpoint.ResourcePath.location.path, completionHandler: completionHandler)
     
     }
}
