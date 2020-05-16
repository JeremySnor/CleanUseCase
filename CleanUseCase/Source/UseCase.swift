//
//  UseCase.swift
//  CleanUseCase
//
//  Created by Artem Eremeev on 13.05.2020.
//  Copyright © 2020 Artem Eremeev. All rights reserved.
//

import Foundation
import RxSwift

open class UseCase<Input, Output> {
    
    private let executionSchedule: ImmediateSchedulerType
    private let resultSchedule: ImmediateSchedulerType
    
    public init(executionSchedule: ImmediateSchedulerType = ConcurrentDispatchQueueScheduler(qos: .background),
         resultSchedule: ImmediateSchedulerType = MainScheduler.asyncInstance) {
        self.executionSchedule = executionSchedule
        self.resultSchedule = resultSchedule
    }
    
    open func createUseCase(input: Input) -> Observable<Output> {
        return Observable.empty()
    }
    
    public func use(input: Input) -> Observable<Output> {
        return createUseCase(input: input)
            .subscribeOn(executionSchedule)
            .observeOn(resultSchedule)
    }
    
}

public extension UseCase where Input == Void {
    func use() -> Observable<Output> {
        return self.use(input: ())
    }
}
