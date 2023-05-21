//
//  AuthenticationError.swift
//  Alted
//
//  Created by Soren SAMAMA on 21/05/2023.
//

import Foundation

enum AuthenticationError: Error, LocalizedError {
    case noUsernameOrPassword
    case invalidResponse
    case requestFailed
    case invalidToken
    
    var errorDescription: String? {
        switch self {
        case .noUsernameOrPassword:
            return "No username or password were provided."
        case .invalidResponse:
            return "Invalid response received."
        case .requestFailed:
            return "Authentication request failed."
        case .invalidToken:
            return "Invalid token."
        }
    }
}
