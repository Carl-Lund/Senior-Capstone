//
//  ExerciseView.swift
//  frontend
//
//  Created by Carl Lund on 4/26/24.
//

import SwiftUI

struct ExerciseView: View {
    
    @Binding var exercise: Exercise
    
    var body: some View {
        HStack {
            Text("Exercise:")
                .bold()
            TextField("", text: $exercise.exercise, prompt: Text("Required"))
        }
        HStack {
            Text("Sets:")
                .bold()
            TextField("", text: $exercise.sets, prompt: Text("Required"))
        }
        HStack {
            Text("Reps:")
                .bold()
            TextField("", text: $exercise.reps, prompt: Text("Required"))
        }
        HStack {
            Text("Notes:")
                .bold()
            TextField("", text: $exercise.notes, prompt: Text("Required"))
        }
    }
}

#Preview {
    ExerciseView(exercise: .constant(Exercise()))
}
