//
//  DataService.swift
//  iSSLocation
//
//  Created by Aminjoni Abdullozoda on 7/19/18.
//  Copyright © 2018 Aminjoni Abdullozoda. All rights reserved.
//

import Foundation

internal class DataService
{
     static let instance = DataService()
    
     //MARK: Endpoints
     let issLocationEndpoint  = "http://api.open-notify.org/iss-now.json"
     let issCrewEndpoint      = "http://api.open-notify.org/astros.json"
    
     //MARK: Keys for UserDefault
     let issPositionKey  = "IssPositionOnMap"
     let issTimeStampKey = "IssTime"
    
     var iSSLocation : ISSLocation?
     var iSSCrew     : ISSCrew?
    
    //MARK: Request to get ISS Current Location
    func RequestLocationISS (issLocationResult : @escaping (ISSLocation) -> Void, Error : @escaping (String) -> Void)
    {
        guard let url = URL(string: issLocationEndpoint) else
        {
            Error("Error: cannot create URL")
            return
        }
        
      let task =  URLSession.shared.dataTask(with: url) { (data
            , responce, error) in
        
            //if no any error
            if (error == nil)
            {
                // Decoding
                let iss = try? JSONDecoder().decode(ISSLocation.self, from: data!)
                //Saving ISS Data to UserDefault
                self.saveIssData(issPosition: (iss?.issPosition)!, timeStamp: (iss?.timestamp)!)
                
                self.iSSLocation = iss
                //CallBack Result ISS
                issLocationResult(iss!)
            }
            else
            // Print Error
            {
                Error(error.debugDescription)
            }
            
        }
        
        task.resume()
    }
    
    //MARK: Request to get list ISS Crew
    func RequestCrewISS (issCrewResult : @escaping (ISSCrew) -> (Void), Error : @escaping (String) -> Void )
    {
        guard let url = URL(string: issCrewEndpoint) else
        {
            Error("Error: cannot create URL")
            return
        }
        
        let task =  URLSession.shared.dataTask(with: url) { (data
            , responce, error) in
            
            //if no any error
            if (error == nil)
            {
                // Decoding
                let issCrew = try? JSONDecoder().decode(ISSCrew.self, from: data!)
                self.iSSCrew = issCrew!
                issCrewResult(issCrew!)
                
            }
            else
            // Print Error
            {
                 Error(error.debugDescription)
            }
            
        }
        
        task.resume()
    }

    //MARK: Save Position and TimeStamp in UserDefault
    private func saveIssData(issPosition : IssPosition, timeStamp:Int)
    {
        let issPosition : [String:String] = ["lat":issPosition.latitude, "lon" : issPosition.longitude]
        
        let userDefault = UserDefaults.standard
        
        userDefault.set(issPosition, forKey: issPositionKey)
        userDefault.set(timeStamp, forKey: issTimeStampKey)
        
    }
}
