//
//  Authenticator.swift
//  Alted
//
//  Created by Soren SAMAMA on 21/05/2023.
//

import Foundation

class Authenticator {
    private var username: String?
    private var password: String?
    
    private var token: Token? {
        didSet {
            self.updateToken?(token)
        }
    }
    
    var updateToken: ((Token?) -> ())?
    
    init(username: String? = nil, password: String? = nil, token: Token? = nil) {
        self.username = username
        self.password = password
        self.token = token
    }
    
    @discardableResult
    func logIn(forceRefresh: Bool = false) async throws -> Bool {
        if let token, !forceRefresh || token.isValid {
            return true
        }
        
        guard let username, let password else {
            throw AuthenticationError.noUsernameOrPassword
        }
        
        var request = URLRequest(url: URL(string: "https://api.ecoledirecte.com/v3/login.awp")!)
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = try ["identifiant": username, "motdepasse": password].edFormatted()
        
        guard let (data, _) = try? await URLSession.shared.data(for: request) else {
            throw AuthenticationError.requestFailed 
        }
        
        
        guard let decodedData = try? JSONDecoder().decode(BaseDecodable<[LoginResponse]>.self, from: data) else {
            throw AuthenticationError.invalidResponse
        }

        guard decodedData.token != nil else {
            throw AuthenticationError.invalidToken
        }
        
        self.token = decodedData.token
        return true
    }
    
    func setUsername(_ username: String?) {
        self.username = username
    }
    
    func setPassword(_ password: String?) {
        self.password = password
    }
}
