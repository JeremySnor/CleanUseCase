//
//  Logout.swift
//  CleanUseCaseExample
//
//  Created by Artem Eremeev on 20.05.2020.
//  Copyright © 2020 Artem Eremeev. All rights reserved.
//

import Foundation
import RxSwift
import CleanUseCase

public class Logout: SingleUseCase<Void, Void> {
    
    private let repository: AuthRepositoryProtocol
    
    init(repository: AuthRepositoryProtocol) {
        self.repository = repository
    }
    
    public override func createUseCase(input: Void) -> Single<Void> {
        return repository.logout()
    }
    
}
