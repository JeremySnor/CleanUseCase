//
//  UseCase.swift
//  CleanUseCase
//
//  Created by Artem Eremeev on 15.06.2020.
//  Copyright © 2020 Artem Eremeev. All rights reserved.
//

import Foundation

open class UseCase<Input, Output>: Executable {
    
    open func createUseCase(input: Input, onResult: @escaping (Output) -> Void) {
        
    }
    
    public func use(input: Input, onCompleted: @escaping (Output) -> Void) {
        executionQueue.async { [weak self] in
            self?.createUseCase(input: input, onResult: { output in
                self?.resultQueue.async {
                    onCompleted(output)
                }
            })
        }
    }
    
}

extension UseCase where Input == Void {
    public func use(onCompleted: @escaping (Output) -> Void) {
        use(input: (), onCompleted: onCompleted)
    }
}
