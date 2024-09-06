//
//  CreateWorkoutView.swift
//  frontend
//
//  Created by Carl Lund on 4/25/24.
//

import SwiftUI

struct CreateWorkoutView: View {
    
    @State var title: String = ""
    @State var timeReq: String = ""
    @State var desc: String = ""
    @State var exercises: [Exercise] = [Exercise()]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack {
                        Text("Workout Title:")
                            .bold()
                        TextField("", text: $title, prompt: Text("Required"))
                    }
                    HStack {
                        Text("Time Requirement:")
                            .bold()
                        TextField("", text: $timeReq, prompt: Text("Required"))
                    }
                    HStack {
                        Text("Description:")
                            .bold()
                        TextField("", text: $desc, prompt: Text("Required"))
                    }
                }
                
                
                ForEach ($exercises) {$exercise in
                    Section {
                        ExerciseView(exercise: $exercise)
                        HStack {
                            Button ("Delete") {
                                removeElement(id: exercise.id)
                            }
                        }
                    }
                }
                
                
                
                Section {
                    Image(systemName: "plus")
                        .foregroundColor(.blue)
                }
                .onTapGesture {
                    exercises.append(Exercise())
                }
                
                Section {
                    Image(systemName: "photo")
                        .foregroundColor(.blue)
                }
                
            }
            .navigationTitle("Create Workout")
            
            Button ("Submit") {
                CreateViewModel.shared.workout.title = title
                CreateViewModel.shared.workout.timeReq = timeReq
                CreateViewModel.shared.workout.description = desc
                // CreateViewModel.shared.workout.exercises = exercises
                
                Task {
                    try await CreateViewModel.shared.createWorkout()
                }
                CreateViewModel.shared.isWorkout = false
            }
        }
    }
    
    func removeElement (id: UUID) {
        exercises.removeAll(where: {$0.id == id})
    }
}

#Preview {
    CreateWorkoutView()
}
