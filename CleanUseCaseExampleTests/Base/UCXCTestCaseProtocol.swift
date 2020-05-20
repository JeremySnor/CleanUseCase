//
//  UCXCTestCase.swift
//  CleanUseCaseExampleTests
//
//  Created by Artem Eremeev on 20.05.2020.
//  Copyright © 2020 Artem Eremeev. All rights reserved.
//

import RxSwift
import RxTest
import RxBlocking
import XCTest

public protocol UCXCTestCaseProtocol {
    func testAllCases()
}

public extension UCXCTestCaseProtocol {
    
    func execute() {
        print("Test Case \"\(String(describing: type(of: self)))\" started")
        testAllCases()
        print("Test Case \"\(String(describing: type(of: self)))\" finished")
    }
    
    func testResultEqual<Input, Output, UC: TestableUseCase, Result: Equatable>(useCase: UC, input: Input, result: Result, resultMapper: @escaping (Output) -> Result, name: String) where UC.InputType == Input, UC.OutputType == Output {
        print("Test \"\(name)\" started")
        XCTAssertEqual(try useCase.invoke(input).map(resultMapper).toBlocking().first(), result, "Test \"\(name)\" failed")
        print("Test \"\(name)\" completed")
    }
    func testResultEqual<Input, Output: Equatable, UC: TestableUseCase>(useCase: UC, input: Input, result: Output, name: String) where UC.InputType == Input, UC.OutputType == Output {
        print("Test \"\(name)\" started")
        XCTAssertEqual(try useCase.invoke(input).toBlocking().first(), result, "Test \"\(name)\" failed")
        print("Test \"\(name)\" completed")
    }
    func testResultEqual<Output: Equatable, UC: TestableUseCase>(useCase: UC, result: Output, name: String) where UC.InputType == Void, UC.OutputType == Output {
        print("Test \"\(name)\" started")
        XCTAssertEqual(try useCase.invoke(()).toBlocking().first(), result, "Test \"\(name)\" failed")
        print("Test \"\(name)\" completed")
    }
    
    func testThrowsError<Input, UC: TestableUseCase>(useCase: UC, input: Input, name: String) where UC.InputType == Input {
        print("Test \"\(name)\" started")
        XCTAssertThrowsError(try useCase.invoke(input).toBlocking().first(), "Test \"\(name)\" failed")
        print("Test \"\(name)\" completed")
    }
    func testThrowsError<UC: TestableUseCase>(useCase: UC, name: String) where UC.InputType == Void {
        print("Test \"\(name)\" started")
        XCTAssertThrowsError(try useCase.invoke(()).toBlocking().first(), "Test \"\(name)\" failed")
        print("Test \"\(name)\" completed")
    }
    
    func testNoThrowError<Input, UC: TestableUseCase>(useCase: UC, input: Input, name: String) where UC.InputType == Input {
        print("Test \"\(name)\" started")
        XCTAssertNoThrow(try useCase.invoke(input).toBlocking().first(), "Test \"\(name)\" failed")
        print("Test \"\(name)\" completed")
    }
    func testNoThrowError<UC: TestableUseCase>(useCase: UC, name: String) where UC.InputType == Void {
        print("Test \"\(name)\" started")
        XCTAssertNoThrow(try useCase.invoke(()).toBlocking().first(), "Test \"\(name)\" failed")
        print("Test \"\(name)\" completed")
    }
    
}
