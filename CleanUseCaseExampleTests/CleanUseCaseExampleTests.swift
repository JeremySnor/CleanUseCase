//
//  CleanUseCaseExampleTests.swift
//  CleanUseCaseExampleTests
//
//  Created by Artem Eremeev on 13.05.2020.
//  Copyright © 2020 Artem Eremeev. All rights reserved.
//

import RxSwift
import RxTest
import RxBlocking
import XCTest

@testable import CleanUseCaseExample

class CleanUseCaseExampleTests: XCTestCase {
    
    lazy var testCases: [UCXCTestCaseProtocol] = [
        AuthTestCase()
    ]

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        for testCase in testCases {
            testCase.execute()
        }
        
    }
    
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
