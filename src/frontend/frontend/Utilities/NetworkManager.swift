//
//  NetworkManager.swift
//  frontend
//
//  Created by Carl Lund on 4/17/24.
//

import Foundation

@MainActor final class NetworkManager {
    static let shared = NetworkManager()
    
    static let baseUrl = "http://localhost:3000"
    private static let login = "\(baseUrl)/login/"
    private static let users = "\(baseUrl)/users/"
    private static let workouts = "\(baseUrl)/workouts/"
    private static let recipes = "\(baseUrl)/recipes/"
    private static let createUser = "\(baseUrl)/create-user/"
    private static let createWorkout = "\(baseUrl)/create-workout/"
    private static let createRecipe = "\(baseUrl)/create-recipe/"
    private static let addFollowing = "\(baseUrl)/add-following/"
    private static let getFollowing = "\(baseUrl)/get-following/"
    private static let deleteFollowing = "\(baseUrl)/delete-following/"
    private static let saveUserImage = "\(baseUrl)/save-user-image/"
    
    
    private init () {}
    
    // USER RELATED QUERIES
    func getUser(username: String, password: String) async throws -> User {
        guard let url = URL(string: "\(NetworkManager.login)\(username)/\(password)") else {
            print("Invalid URL")
            throw ULError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let decodedUser = try decoder.decode(User.self, from: data)
            print("Login for \(decodedUser.username) was successful!")
            UpLiftTabViewModel.shared.loggingIn = false
            return decodedUser
        } catch {
            print("decoding failed")
            return User()
        }
        
    }
    
    func createUser(user: User) async throws -> Void {
        guard let url = URL(string: "\(NetworkManager.createUser)") else {
            print("Invalid URL")
            throw ULError.invalidURL
        }
        
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        let data = try? encoder.encode(user)
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = data
        
        let dataTask = URLSession.shared.dataTask(with: request)
        
        dataTask.resume()
    }
    
    func getUsersViaUsername(username: String) async throws -> [User] {
        guard let url = URL(string: "\(NetworkManager.users)\(username)") else {
            print("Invalid URL")
            throw ULError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let decodedUsers = try decoder.decode([User].self, from: data)
            print("Getting users was successful!")
            return decodedUsers
        } catch {
            print("Decoding in getUsersViaUsername failed")
            return []
        }
        
    }
    
    // Adds a followee and returns the current users following list
    func addFollowing(username: String, following_username: String) async throws -> Void {
        guard let url = URL(string: "\(NetworkManager.addFollowing)") else {
            print("Invalid URL")
            throw ULError.invalidURL
        }
        
        let encoder = JSONEncoder()
        // encoder.keyEncodingStrategy = .convertToSnakeCase
        let data = try? encoder.encode([username, following_username])
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = data
        
        let dataTask = URLSession.shared.dataTask(with: request)
        
        dataTask.resume()
    }
    
    func deleteFollowing(username: String, following_username: String) async throws -> Void {
        guard let url = URL(string: "\(NetworkManager.deleteFollowing)") else {
            print("Invalid URL")
            throw ULError.invalidURL
        }
        
        let encoder = JSONEncoder()
        // encoder.keyEncodingStrategy = .convertToSnakeCase
        let data = try? encoder.encode([username, following_username])
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "DELETE"
        request.httpBody = data
        
        let dataTask = URLSession.shared.dataTask(with: request)
        
        dataTask.resume()
    }
    
    func getFollowing(username: String) async throws -> [String] {
        guard let url = URL(string: "\(NetworkManager.getFollowing)\(username)") else {
            print("Invalid URL")
            throw ULError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let decodedUsers = try decoder.decode([String].self, from: data)
            print("Getting following was successful!")
            return decodedUsers
        } catch {
            print("Decoding in NetworkManager failed")
            return []
        }
        
    }
    
    func saveUserImage(imageModel: ImageModel, id: Int) async throws -> Void {
        guard let url = URL(string: "\(NetworkManager.saveUserImage)\(id)") else {
            print("Invalid URL")
            throw ULError.invalidURL
        }
        
        let encoder = JSONEncoder()
        let data = try? encoder.encode(imageModel)
        
        print(id)
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "PATCH"
        request.httpBody = data
        
        let dataTask = URLSession.shared.dataTask(with: request)
        
        dataTask.resume()
    }
    
    
    // POST RELATED QUERIES (not like json post, like social media post)
    
    func getWorkouts(username: String) async throws -> [Workout] {
        guard let url = URL(string: "\(NetworkManager.workouts)\(username)") else {
            print("Invalid URL")
            throw ULError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let decodedUser = try decoder.decode([Workout].self, from: data)
            print("Getting workouts was successful!")
            return decodedUser
        } catch {
            print("decoding failed")
            return []
        }
        
    }
    
    func getRecipes(username: String) async throws -> [Recipe] {
        guard let url = URL(string: "\(NetworkManager.recipes)\(username)") else {
            print("Invalid URL")
            throw ULError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            decoder.dateDecodingStrategy = .formatted(formatter)
            let decodedUser = try decoder.decode([Recipe].self, from: data)
            print("Getting recipes was successful!")
            return decodedUser
        } catch {
            print("decoding failed")
            return []
        }
        
    }
    
    func createWorkout(workout: Workout) async throws -> Void {
        guard let url = URL(string: "\(NetworkManager.createWorkout)") else {
            print("Invalid URL")
            throw ULError.invalidURL
        }
        
        let encoder = JSONEncoder()
//        encoder.keyEncodingStrategy = .convertToSnakeCase
        let data = try? encoder.encode(workout)
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = data
        
        let dataTask = URLSession.shared.dataTask(with: request)
        
        dataTask.resume()
    }
    
    func createRecipe(recipe: Recipe) async throws -> Void {
        guard let url = URL(string: "\(NetworkManager.createRecipe)") else {
            print("Invalid URL")
            throw ULError.invalidURL
        }
        
        let encoder = JSONEncoder()
//        encoder.keyEncodingStrategy = .convertToSnakeCase
        let data = try? encoder.encode(recipe)
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = data
        
        let dataTask = URLSession.shared.dataTask(with: request)
        
        dataTask.resume()
    }
    
}
