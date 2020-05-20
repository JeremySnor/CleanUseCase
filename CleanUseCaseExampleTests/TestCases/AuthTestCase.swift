//
//  AuthTestCase.swift
//  CleanUseCaseExampleTests
//
//  Created by Artem Eremeev on 20.05.2020.
//  Copyright © 2020 Artem Eremeev. All rights reserved.
//

import Foundation
import XCTest

@testable import CleanUseCaseExample

public class AuthTestCase: UCXCTestCaseProtocol {
    
    let authRepository = MockAuthRepository()
    lazy var signIn = SignIn(repository: authRepository)
    lazy var logout = Logout(repository: authRepository)
    
    public func testAllCases() {
        
        testResultEqual(useCase: signIn,
                        input: SignInInput(email: "test@test.com", password: "test"),
                        result: 1,
                        resultMapper: { $0.user.id },
                        name: "Correct SignIn")
        
        testThrowsError(useCase: signIn,
                        input: SignInInput(email: "qwe@qwe.com", password: "qwe"),
                        name: "Incorrect SignIn")
        
        testNoThrowError(useCase: logout,
                         name: "Correct Logout")
        
    }
    
}
