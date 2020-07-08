//
//  NewsRepository.swift
//  iSSLocation
//
//  Created by Aminjoni Abdullozoda on 7/8/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import Foundation
class NewsRepository {
    
    static func requestNewsSpace (completionHandler : @escaping (Result<News,APIError>) -> Void ) {
      
   
        Networking.request(url: Endpoint.ResourcePath.headlineSpaceNews.path, completionHandler: completionHandler)
    }
}
