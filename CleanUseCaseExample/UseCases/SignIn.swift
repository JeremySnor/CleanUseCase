//
//  SignIn.swift
//  CleanUseCaseExample
//
//  Created by Artem Eremeev on 20.05.2020.
//  Copyright © 2020 Artem Eremeev. All rights reserved.
//

import Foundation
import RxSwift
import CleanUseCase

public class SignIn: SingleUseCase<SignInInput, SignInOutput> {
    
    private let repository: AuthRepositoryProtocol
    
    init(repository: AuthRepositoryProtocol) {
        self.repository = repository
    }
    
    public override func createUseCase(input: SignInInput) -> Single<SignInOutput> {
        return repository.signIn(email: input.email, password: input.password).map({ user in
            return SignInOutput(user: user)
        })
    }
    
}
