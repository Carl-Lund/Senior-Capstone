//
//  Recipe.swift
//  frontend
//
//  Created by Carl Lund on 4/30/24.
//

import Foundation
import Observation

struct Recipe: Codable, Hashable {
    var title: String = ""
    var timeReq: String = ""
    var description: String = ""
    var username: String?
    var ingredients: String = ""
    var directions: String = ""
    // var created: Date = Date()
}
