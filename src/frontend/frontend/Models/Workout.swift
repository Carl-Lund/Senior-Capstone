//
//  Workout.swift
//  frontend
//
//  Created by Carl Lund on 4/29/24.
//

import Foundation
import Observation

struct Workout: Codable, Hashable {
    var title: String = ""
    var timeReq: String = ""
    var description: String = ""
    // var exercises: [Exercise] = [Exercise()]
}
