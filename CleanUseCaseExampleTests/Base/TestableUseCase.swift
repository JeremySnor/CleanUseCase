//
//  TestableUseCase.swift
//  CleanUseCaseExampleTests
//
//  Created by Artem Eremeev on 20.05.2020.
//  Copyright © 2020 Artem Eremeev. All rights reserved.
//

import Foundation
import RxSwift
import CleanUseCase
import XCTest

public protocol TestableUseCase {
    associatedtype InputType
    associatedtype OutputType
    
    func invoke(_ input: InputType) -> Observable<OutputType>
}

extension SingleUseCase: TestableUseCase {
    
    public func invoke(_ input: Input) -> Observable<Output> {
        return use(input: input).asObservable()
    }
    
}

extension ObservableUseCase: TestableUseCase  {
    
    public func invoke(_ input: Input) -> Observable<Output> {
        return use(input: input)
    }
    
}
