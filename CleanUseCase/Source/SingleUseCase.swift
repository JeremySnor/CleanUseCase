//
//  SingleUseCase.swift
//  CleanUseCase
//
//  Created by Artem Eremeev on 19.05.2020.
//  Copyright © 2020 Artem Eremeev. All rights reserved.
//

import Foundation
import RxSwift

open class SingleUseCase<Input, Output>: Executable, UseCaseProtocol {
    public typealias InputType = Input
    public typealias OutputType = Output
    public typealias ObservableResultType = Single<Output>
    
    open func createUseCase(input: Input) -> Single<Output> {
        return .never()
    }
    
    public func use(input: Input) -> Single<Output> {
        return createUseCase(input: input)
            .subscribeOn(executionSchedule)
            .observeOn(resultSchedule)
    }
}

public extension SingleUseCase where Input == Void {
    func use() -> Single<Output> {
        return self.use(input: ())
    }
}

