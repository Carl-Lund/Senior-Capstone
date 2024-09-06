//
//  CreateRecipeView.swift
//  frontend
//
//  Created by Carl Lund on 4/25/24.
//

import SwiftUI

struct CreateRecipeView: View {
//    @State var title = ""
//    @State var timeReq = ""
//    @State var desc = ""
//    @State var ingredients: String = ""
//    @State var directions: String = ""
    @State var recipe =  Recipe()
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack {
                        Text("Recipe Title:")
                            .bold()
                        TextField("", text: $recipe.title, prompt: Text("Required"))
                    }
                    HStack {
                        Text("Time Requirement:")
                            .bold()
                        TextField("", text: $recipe.timeReq, prompt: Text("Required"))
                    }
                    HStack {
                        Text("Description:")
                            .bold()
                        TextField("", text: $recipe.description, prompt: Text("Required"))
                    }
                }
                
                Section {
                    Text("Ingredients").bold()
                    TextEditor(text: $recipe.ingredients)
                }
                
                Section {
                    Text("Directions").bold()
                    TextEditor(text: $recipe.directions)
                }
                
                Section {
                    Image(systemName: "photo")
                        .foregroundColor(.blue)
                }
                
                
            }
            .navigationTitle("Create Recipe")
            
            Button ("Submit") {
                self.recipe.username = UpLiftTabViewModel.shared.user.username
                Task {
                    try await NetworkManager.shared.createRecipe(recipe: self.recipe)
                }
                CreateViewModel.shared.isRecipe = false
            }
        }
    }
}

#Preview {
    CreateRecipeView()
}
