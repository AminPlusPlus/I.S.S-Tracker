//
//  iSSLocationTests.swift
//  iSSLocationTests
//
//  Created by Aminjoni Abdullozoda on 7/19/18.
//  Copyright © 2018 Aminjoni Abdullozoda. All rights reserved.
//

import XCTest
@testable import iSSLocation

class iSSLocationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDataService() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let locationEndpoint  = "http://api.open-notify.org/iss-now.json"
        let crewEndpoint  = "http://api.open-notify.org/astros.json"
        
        XCTAssertEqual(DataService.instance.issLocationEndpoint,locationEndpoint)
        XCTAssertEqual(DataService.instance.issCrewEndpoint,crewEndpoint)
        
        XCTAssertEqual(DataService.instance.iSSCrew?.number, 6)
        XCTAssertEqual(DataService.instance.iSSLocation?.message, "success")
    }
    
  
    
}
