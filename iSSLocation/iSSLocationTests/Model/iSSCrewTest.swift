//
//  iSSCrewTest.swift
//  iSSLocationTests
//
//  Created by Aminjoni Abdullozoda on 7/8/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import XCTest
@testable import iSSLocation
class iSSCrewTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testNewIssCrew(){
        let james = Person(craft: "Nasa", name: "James")
        let michail = Person(craft: "Roscosmos", name: "Michail")
        
        let crew = ISSCrew(message: "nice", people: [james,michail], number: 2)
        
        XCTAssertEqual(crew.people.count, 2)
    }

}
