//
//  Exercise.swift
//  frontend
//
//  Created by Carl Lund on 4/29/24.
//

import Foundation

struct Exercise: Identifiable, Equatable, Codable, Hashable {
    
    let id = UUID()
    var exercise = ""
    var sets = ""
    var reps = ""
    var notes = ""
    
}
