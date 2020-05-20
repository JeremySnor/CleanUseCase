//
//  MockAuthRepository.swift
//  CleanUseCaseExample
//
//  Created by Artem Eremeev on 20.05.2020.
//  Copyright © 2020 Artem Eremeev. All rights reserved.
//

import Foundation
import RxSwift
import CleanUseCaseExample

public class MockAuthRepository: AuthRepositoryProtocol {
    
    public func signIn(email: String, password: String) -> Single<User> {
        guard email == "test@test.com", password == "test" else {
            return .error(NSError(domain: "MockAuthRepository.signIn", code: 401, userInfo: nil))
        }
        return .just(User(id: 1, email: email, name: "test user"))
    }
    
    public func logout() -> Single<Void> {
        return .just(())
    }
    
}
