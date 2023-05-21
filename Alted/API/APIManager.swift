//
//  APIManager.swift
//  Alted
//
//  Created by Soren SAMAMA on 21/05/2023.
//

import Foundation

class APIManager {
    static let shared = APIManager()

    private(set) var username: String? = nil
    private(set) var password: String? = nil
    
    private(set) var token: Token? = nil
    
    var authenticator: Authenticator
    
    init() {
        self.authenticator = Authenticator(username: username, password: password, token: token)
        
        authenticator.updateToken = { newToken in
            self.token = newToken
        }
    }
    
    func setToken(_ token: Token?) {
        self.token = token
    }
    
    func setUsername(_ username: String?) {
        self.username = username
        self.authenticator.setUsername(username)
    }
    
    func setPassword(_ password: String?) {
        self.password = password
        self.authenticator.setPassword(password)
    }
}
