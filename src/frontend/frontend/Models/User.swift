//
//  User.swift
//  frontend
//
//  Created by Carl Lund on 3/14/24.
//

import Foundation
import Observation
import PhotosUI

@Observable
class User: Codable, Hashable {
    
    enum CodingKeys: CodingKey {
        case user_id, username, password, biography, following, userImage
    }
    
    var user_id = Int()
    var username = ""
    var password = ""
    var bio = ""
    var following: [String] = []
    var userImage: Data = Data()
    var profImage: UIImage?
    
    init () {}
    
    init (user_id: Int, username: String, password: String, bio: String, following: [String], userImage: Data) {
        self.user_id = user_id
        self.username = username
        self.password = password
        self.bio = bio
        self.following = following
        self.userImage = userImage
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(user_id, forKey: .user_id)
        try container.encode(username, forKey: .username)
        try container.encode(password, forKey: .password)
        try container.encode(bio, forKey: .biography)
        try container.encode(following, forKey: .following)
        try container.encode(userImage, forKey: .userImage)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        user_id = try container.decode(Int.self, forKey: .user_id)
        username = try container.decode(String.self, forKey: .username)
        password = try container.decode(String.self, forKey: .password)
        bio = try container.decode(String.self, forKey: .biography)
        following = try container.decode([String].self, forKey: .following)
        userImage = try container.decode(Data.self, forKey: .userImage)
    }
    
    func setProfImage () {
        self.profImage = UIImage(data: self.userImage)
    }
    
    func isFollowing (username: String) -> Bool {
        for follower in self.following {
            if username == follower {
                return true
            }
        }
        return false
    }

    // Needed to conform to Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
    
    // Needed to confrom to Equatable (which is also needed to conform to Hashable)
    static func == (lhs: User, rhs: User) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
}

struct UserResponse: Decodable {
    let request: User
}

struct Usernames: Decodable {
    let request: [String]
}
