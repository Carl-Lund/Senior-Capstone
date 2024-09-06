//
//  MockData.swift
//  frontend
//
//  Created by Carl Lund on 4/18/24.
//

import Foundation

struct MockData {
    
//    static let sampleUser = User (user_id: 1000,
//                                 username: "MockUser",
//                                 password: "MockPassword",
//                                 bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
//                                 following: ["CarlLund","Test","test"])
    
    static let sampleRecipe = PostTest (username: "MockRecUser",
                                   title: "Egg White Omelette",
                                   timeReq: "15 Min",
                                   desc: "This is how you make the perfect egg white omelette",
                                   imageUrl: "https://healthyrecipesblogs.com/wp-content/uploads/2013/02/egg-white-omelet-featured.jpg")
    
    static let samplePost = PostTest (username: "MockUser",
                                  title: "Back Day Hack",
                                  timeReq: "1 Hour",
                                  desc: "Exercise: Rows\nSets: 3\nReps: 10\n\nExercise: Lat Pulldowns\nSets: 3\nReps: 15",
                                  imageUrl: "https://hips.hearstapps.com/hmg-prod/images/core-workouts-at-home-1666192539.png")
    
    static let samplePost1 = PostTest (username: "MockUser1",
                                  title: "Crazy Leg Day",
                                  timeReq: "1 Hour1",
                                  desc: "Do this every back day to get a massive PUMP bro.1",
                                  imageUrl: "https://media.self.com/photos/61bcd0e05aed92fc4251b026/4:3/w_2560%2Cc_limit/GettyImages-1213234926.jpeg")
    
    static let samplePost2 = PostTest (username: "MockUser2",
                                  title: "Back Day Hack2",
                                  timeReq: "1 Hour2",
                                  desc: "Do this every back day to get a massive PUMP bro.2",
                                  imageUrl: "https://prod-ne-cdn-media.puregym.com/media/819394/gym-workout-plan-for-gaining-muscle_header.jpg?quality=80")
    
    static let samplePost3 = PostTest (username: "MockUser3",
                                  title: "Back Day Hack3",
                                  timeReq: "1 Hour3",
                                  desc: "Do this every back day to get a massive PUMP bro.3",
                                  imageUrl: "https://www.mensjournal.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTk2MTM2MDQyNDIzOTg1Mjk3/dbfrontsquat.jpg")
    
    
    static let sampleFeed = [samplePost, samplePost1, samplePost2, samplePost3]
    
    static let sampleUsernames = ["CarlLund", "Carl Smith", "CarlJones", "Gerald O'connor", "Germaine Jones"]
    
}
