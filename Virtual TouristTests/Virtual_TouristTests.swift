//
//  Virtual_TouristTests.swift
//  Virtual TouristTests
//
//  Created by user on 22/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import XCTest
@testable import Virtual_Tourist
class Virtual_TouristTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testExample() {
        let url = ApiHelper.EndPoints.searchPhotoByLatAndLong(3.194045, 101.675362).url
        print (url)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
