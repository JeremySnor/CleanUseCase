//
//  Executable.swift
//  CleanUseCase
//
//  Created by Artem Eremeev on 13.05.2020.
//  Copyright © 2020 Artem Eremeev. All rights reserved.
//

import Foundation
import RxSwift

open class Executable {
    
    private let _executionSchedule: ImmediateSchedulerType
    private let _resultSchedule: ImmediateSchedulerType
    
    var executionSchedule: ImmediateSchedulerType {
        return _executionSchedule
    }
    var resultSchedule: ImmediateSchedulerType {
        return _resultSchedule
    }
    
    public init(executionSchedule: ImmediateSchedulerType = ConcurrentDispatchQueueScheduler(qos: .background),
         resultSchedule: ImmediateSchedulerType = MainScheduler.asyncInstance) {
        self._executionSchedule = executionSchedule
        self._resultSchedule = resultSchedule
    }
    
}


