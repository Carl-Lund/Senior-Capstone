//
//  FeedPostView.swift
//  frontend
//
//  Created by Carl Lund on 4/18/24.
//

import SwiftUI

struct FeedRecipeView: View {
    
    var recipe: Recipe
    
    var body: some View {
        VStack (spacing: 0){
            HStack {
                CircleImage(width: 40, borderIsShow: false, image: UpLiftTabViewModel.shared.user.profImage)
                Text(recipe.username ?? "Username")
                    .foregroundStyle(Color.white)
                    .bold()
            }
            .padding(03)
            .frame(maxWidth: .infinity)
            .background(Color.gray)
            AsyncImage(url: URL(string: "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 350)
                    .background(.black)
            } placeholder: {
                Image(systemName: "photo")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 350)
                    .background(.black)
            }

            HStack {
                Spacer()
                VStack {
                    Text("Workout")
                        .bold()
                    Text(recipe.title)
                }
                .foregroundColor(.white)
                Spacer()
                VStack {
                    Text("Time Requirement")
                        .bold()
                    Text(recipe.timeReq)
                }
                .foregroundColor(.white)
                Spacer()
            }
            .padding(.bottom, 10)
            .padding(.top, 10)
            .background(Color.gray)
            
            Text(recipe.description)
                .padding()
                .frame(maxWidth: .infinity)
                .border(.black, width: 2)
        }
    }
}

#Preview {
    FeedRecipeView(recipe: Recipe())
}
