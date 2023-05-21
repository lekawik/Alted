//
//  Token.swift
//  Alted
//
//  Created by Soren SAMAMA on 21/05/2023.
//

import Foundation

struct Token {
    var value: String
    var expirationDate: Date
    var isValid: Bool {
        Date() < expirationDate
    }
    
    init(value: String = "", expiration: Date = Date().addingTimeInterval(300)) {
        self.value = value
        self.expirationDate = expiration
    }
}
