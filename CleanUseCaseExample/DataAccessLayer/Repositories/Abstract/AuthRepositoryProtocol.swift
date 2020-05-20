//
//  AuthRepositoryProtocol.swift
//  CleanUseCaseExample
//
//  Created by Artem Eremeev on 20.05.2020.
//  Copyright © 2020 Artem Eremeev. All rights reserved.
//

import Foundation
import RxSwift

public protocol AuthRepositoryProtocol {
    
    func signIn(email: String, password: String) -> Single<User>
    func logout() -> Single<Void>
    
}
