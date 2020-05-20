//
//  UseCaseProtocol.swift
//  CleanUseCase
//
//  Created by Artem Eremeev on 19.05.2020.
//  Copyright © 2020 Artem Eremeev. All rights reserved.
//

import Foundation
import RxSwift

public protocol UseCaseProtocol {
    associatedtype InputType
    associatedtype OutputType
    associatedtype ObservableResultType
    
    func createUseCase(input: InputType) -> ObservableResultType
    func use(input: InputType) -> ObservableResultType
}


