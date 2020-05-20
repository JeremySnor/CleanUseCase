//
//  ObservableUseCase.swift
//  CleanUseCase
//
//  Created by Artem Eremeev on 19.05.2020.
//  Copyright © 2020 Artem Eremeev. All rights reserved.
//

import Foundation
import RxSwift

open class ObservableUseCase<Input, Output>: Executable, UseCaseProtocol {
    public typealias InputType = Input
    public typealias OutputType = Output
    public typealias ObservableResultType = Observable<Output>
    
    open func createUseCase(input: Input) -> Observable<Output> {
        return .never()
    }
    
    public func use(input: Input) -> Observable<Output> {
        return createUseCase(input: input)
            .subscribeOn(executionSchedule)
            .observeOn(resultSchedule)
    }
}

public extension ObservableUseCase where Input == Void {
    func use() -> Observable<Output> {
        return self.use(input: ())
    }
}
