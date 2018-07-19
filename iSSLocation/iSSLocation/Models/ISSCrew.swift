//
//  ISSCraft.swift
//  iSSLocation
//
//  Created by Aminjoni Abdullozoda on 7/19/18.
//  Copyright © 2018 Aminjoni Abdullozoda. All rights reserved.
//

import Foundation

struct ISSCrew: Codable {
    let message: String
    let people: [Person]
    let number: Int
    
    
    //MARK: Getting List of Crew as String
    func getListCrew() -> String{
        
        let list = people.map({ (person) -> String in
            return "\(person.name)"
        })
        
        return list.joined(separator: "\n")
    }
}

struct Person: Codable {
    let craft, name: String
}
