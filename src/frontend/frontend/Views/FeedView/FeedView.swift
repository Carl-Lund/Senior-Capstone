//
//  FeedView.swift
//  frontend
//
//  Created by Carl Lund on 4/11/24.
//

import SwiftUI

struct FeedView: View {
    @State var recipes: [Recipe] = [Recipe()]
    @State var workouts: [Workout] = [Workout()]
    
    var body: some View {
        ScrollView {
            LazyVStack (spacing: 0) {
                ForEach(workouts, id: \.self) { Workout in
                    FeedWorkoutView(workout: Workout)
                }
                ForEach(recipes, id: \.self) { Recipe in
                    FeedRecipeView(recipe: Recipe)
                }
            }
        }
        .onAppear(perform: {
            UpLiftTabViewModel.shared.user.setProfImage()
            print (UpLiftTabViewModel.shared.user.profImage)
            Task { await getMyPosts() }
            Task { await getFollowingsPosts (following: UpLiftTabViewModel.shared.user.following) }
        })
    }
    
    func getMyPosts () async {
        Task { workouts = try await NetworkManager.shared.getWorkouts(username: UpLiftTabViewModel.shared.user.username) }
        Task { recipes = try await NetworkManager.shared.getRecipes(username: UpLiftTabViewModel.shared.user.username) }
    }
    
    func getFollowingsPosts (following: [String]) async {
        for followee in following {
            Task {
                let followingWorkouts = try await NetworkManager.shared.getWorkouts(username: followee)
                for workout in followingWorkouts {
                    workouts.append(workout)
                }
            }
            Task {
                let followingRecipes = try await NetworkManager.shared.getRecipes(username: followee)
                for recipe in followingRecipes {
                    recipes.append(recipe)
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
