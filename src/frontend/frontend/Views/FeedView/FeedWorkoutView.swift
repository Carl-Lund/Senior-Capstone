//
//  FeedWorkoutView.swift
//  frontend
//
//  Created by Carl Lund on 5/2/24.
//

import SwiftUI

struct FeedWorkoutView: View {
    
    var workout: Workout
    
    var body: some View {
        VStack (spacing: 0){
            HStack {
                CircleImage(width: 40, borderIsShow: false, image: UpLiftTabViewModel.shared.user.profImage)
                Text("CarlLund")
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
                    Text(workout.title)
                }
                .foregroundColor(.white)
                Spacer()
                VStack {
                    Text("Time Requirement")
                        .bold()
                    Text(workout.timeReq)
                }
                .foregroundColor(.white)
                Spacer()
            }
            .padding(.bottom, 10)
            .padding(.top, 10)
            .background(Color.gray)
            
            Text(workout.description)
                .padding()
                .frame(maxWidth: .infinity)
                .border(.black, width: 2)
        }
    }
}

#Preview {
    FeedWorkoutView(workout: Workout())
}
