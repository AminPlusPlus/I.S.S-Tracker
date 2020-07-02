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
    
    static func fetchLocationISS() -> AnyPublisher<ISSLocation,Error> {
        let request = URLRequest(url: Endpoint.location.url)
        return Networking.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
        
    }
}
