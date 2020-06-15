//
//  Executable.swift
//  CleanUseCase
//
//  Created by Artem Eremeev on 15.06.2020.
//  Copyright © 2020 Artem Eremeev. All rights reserved.
//

import Foundation

open class Executable {
    
    private let _executionQueue: DispatchQueue
    private let _resultQueue: DispatchQueue
    
    var executionQueue: DispatchQueue {
        return _executionQueue
    }
    var resultQueue: DispatchQueue {
        return _resultQueue
    }
    
    public init(executionQueue: DispatchQueue = .global(qos: .background), resultQueue: DispatchQueue = .main) {
        self._executionQueue = executionQueue
        self._resultQueue = resultQueue
    }
    
}
