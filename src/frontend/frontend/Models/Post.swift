//
//  Post.swift
//  frontend
//
//  Created by Carl Lund on 4/18/24.
//

import Foundation

class Post: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case username, title, timeReq, description, ingredients, directions
    }
    
    //var type = ""
    var username = ""
    var title = ""
    var timeReq = ""
    var desc = ""
//    var ingredients = ""
//    var directions = ""
    //var exercises: [Exercise] = []
    
    init () {}
    
    init (type: String, username: String, title: String, timeReq: String, desc: String, ingredients: String, directions: String, exercises: [Exercise]) {
        //self.type = type
        self.title = title
        self.timeReq = timeReq
        self.desc = desc
        self.username = username
//        self.ingredients = ingredients
//        self.directions = directions
        //self.exercises = exercises
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        //try container.encode(type, forKey: .type)
        try container.encode(title, forKey: .title)
        try container.encode(timeReq, forKey: .timeReq)
        try container.encode(desc, forKey: .description)
        try container.encode(username, forKey: .username)
//        try container.encode(ingredients, forKey: .ingredients)
//        try container.encode(directions, forKey: .directions)
        //try container.encode(exercises, forKey: .exercises)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //type = try container.decode(String.self, forKey: .type)
        title = try container.decode(String.self, forKey: .title)
        timeReq = try container.decode(String.self, forKey: .timeReq)
        desc = try container.decode(String.self, forKey: .description)
        username = try container.decode(String.self, forKey: .username)
//        ingredients = try container.decode(String.self, forKey: .ingredients)
//        directions = try container.decode(String.self, forKey: .directions)
        //exercises = try container.decode([Exercise].self, forKey: .exercises)
    }
    
}

struct PostResponse: Decodable {
    let request: Post
}

struct PostsResponse: Decodable {
    let request: [Post]
}
