//
//  CreateViewModel.swift
//  frontend
//
//  Created by Carl Lund on 4/25/24.
//

import Foundation
import Observation

@Observable final class CreateViewModel {
    
    static let shared = CreateViewModel()
    var isWorkout = false
    var isRecipe = false
    var workout = Workout()
    
    
//    func addExercise () {
//        workout.exercises.append(Exercise())
//    }
//    
//    func removeExercise (exercise: Exercise) {
//        let index = workout.exercises.firstIndex(of: exercise)
//        workout.exercises.remove(at: index!)
//    }
    
    func createWorkout () async throws {
        try await NetworkManager.shared.createWorkout(workout: self.workout)
    }

}
