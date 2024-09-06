//
//  User.swift
//  swiftui
//
//  Created by Carl Lund on 2/21/24.
//

import Foundation

@Observable
class User: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case username, password
    }
    
    var username = ""
    var password = ""
    
    init() {}
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(username, forKey: .username)
        try container.encode(password, forKey: .password)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        username = try container.decode(String.self, forKey: .username)
        password = try container.decode(String.self, forKey: .password)
    }
    
}
    
