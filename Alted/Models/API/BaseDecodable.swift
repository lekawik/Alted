//
//  BaseDecodable.swift
//  Alted
//
//  Created by Soren SAMAMA on 21/05/2023.
//

import Foundation

struct BaseDecodable<Data: Decodable>: Decodable {
    var code: Int
    var token: Token?
    var message: String?
    var data: Data?
    
    enum CodingKeys: CodingKey {
        case code
        case token
        case message
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<BaseDecodable<Data>.CodingKeys> = try decoder.container(keyedBy: BaseDecodable<Data>.CodingKeys.self)

        self.code = try container.decode(Int.self, forKey: .code)
        self.token = Token(value: (try container.decodeIfPresent(String.self, forKey: .token) ?? ""))
        self.message = try container.decodeIfPresent(String.self, forKey: .message)
        self.data = try container.decodeIfPresent(Data.self, forKey: .data)
    }
}
