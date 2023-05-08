//
//  SwiftTestingAppTests.swift
//  SwiftTestingAppTests
//
//  Created by Matteo Buompastore on 08/05/23.
//

import XCTest
@testable import SwiftTestingApp

final class SwiftTestingAppTests: XCTestCase {

    let math = MathFunctions()
    
    func testAddFunction() {
        let result = math.addIntegers(x: 5, y: 13)
        XCTAssertEqual(result, 18)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
