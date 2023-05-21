//
//  Dictionnary++.swift
//  Alted
//
//  Created by Soren SAMAMA on 21/05/2023.
//

import Foundation

extension Dictionary where Key == String, Value == Any {
    func jsonString() throws -> String {
        let data = try JSONSerialization.data(withJSONObject: self)
        let stringJson = (String(data: data, encoding: .utf8) ?? "")
        return stringJson.replacingOccurrences(of: "\\", with: "")
    }
    
    func edFormatted() throws -> Data? {
        let jsonString = try self.jsonString()
        return "data=\(jsonString)".data(using: .utf8)
    }
}
