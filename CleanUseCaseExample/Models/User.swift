//
//  User.swift
//  CleanUseCaseExample
//
//  Created by Artem Eremeev on 20.05.2020.
//  Copyright © 2020 Artem Eremeev. All rights reserved.
//

import Foundation

public struct User {
    let id: Int
    let email: String
    let name: String
    
    public init(id: Int, email: String, name: String) {
        self.id = id
        self.email = email
        self.name = name 
    }
}
