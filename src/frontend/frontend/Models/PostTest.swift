//
//  PostTest.swift
//  frontend
//
//  Created by Carl Lund on 4/24/24.
//

import Foundation

struct PostTest: Hashable, Identifiable {
    let id = UUID()
    let username: String
    let title: String
    let timeReq: String
    let desc: String
    let imageUrl: String
}

struct PostTestResponse {
    let request: [Post]
}
