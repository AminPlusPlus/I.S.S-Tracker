//
//  Networking.swift
//  iSSLocation
//
//  Created by Aminjoni Abdullozoda on 7/1/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import Foundation

enum APIError: Error {
    case URL_Problem
    case invalidResponce
    case unknown
    case apiError(reason: String)


    var errorDescription: String? {
        switch self {
        case .URL_Problem:
            return "URL requestion is not correct!"
        case .invalidResponce:
            return "Invalid responce"
        case .unknown:
            return "Unknown error"
        case .apiError(let reason):
            return reason
        }
    }
}


class Networking {
    
    /// Generic Request
    /// - Parameters:
    ///   - url: URL
    ///   - completionHandler: T : Decotable
    static func request <T : Decodable> (url : String, completionHandler : @escaping (Result<T,APIError>) -> Void) {
        
        
        guard let url = URL(string: url) else {
            completionHandler(.failure(.URL_Problem))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, responce, error) in
            
            guard let responce = responce as? HTTPURLResponse, responce.statusCode == 200 else  {
                completionHandler(.failure(.invalidResponce))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(.apiError(reason: "Data receiving something wrong with that")))
                return
            }
            
            //parse
            do {
                
                let jsonDecoder = JSONDecoder()
                let result = try jsonDecoder.decode(T.self, from: data)
                completionHandler(.success(result))
                
            }catch {
                completionHandler(.failure(.apiError(reason: "parsing issue")))
            }
            
            
            
        }
        
        task.resume()
        
        
    }
   
}
