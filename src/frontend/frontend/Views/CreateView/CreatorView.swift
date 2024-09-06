//
//  CreatorView.swift
//  frontend
//
//  Created by Carl Lund on 4/11/24.
//

import SwiftUI

struct CreatorView: View {
    
    var body: some View {
        ZStack {
            VStack {
                CreateButton(labelText: "Create New Workout", icon: "dumbbell.fill", type: "workout")
                    .padding(.bottom, 75)
                CreateButton(labelText: "Create New Recipe", icon: "carrot.fill", type: "recipe")
            }
            if CreateViewModel.shared.isWorkout {
                CreateWorkoutView()
            }
            if CreateViewModel.shared.isRecipe {
                CreateRecipeView()
            }
        }
        .onAppear(perform: {
            CreateViewModel.shared.isWorkout = false
            CreateViewModel.shared.isRecipe = false
        })
        
    }
}

#Preview {
    CreatorView()
}

struct CreateButton: View {
    
    var labelText: String
    var icon: String
    var type: String
    
    var body: some View {
        Button {
            if (type == "workout") {
                CreateViewModel.shared.isWorkout = true
            } else {
                CreateViewModel.shared.isRecipe = true
            }
        } label : {
            VStack {
                Text(labelText)
                    .padding(.bottom, 10)
                Image(systemName: icon)
            }
            .font(.system(size: 20, weight: .bold, design: .default))
            .foregroundStyle(Color.white)
            .frame(width: 300, height: 100)
            .background(Color("mainColor"))
            .cornerRadius(10.0)
        }
    }
}
