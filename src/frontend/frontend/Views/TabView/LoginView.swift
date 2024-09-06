//
//  LoginView.swift
//  frontend
//
//  Created by Carl Lund on 3/14/24.
//

import SwiftUI

@MainActor struct LoginView: View {
    
    @State private var username: String = "";
    @State private var password: String = "";
    
    var body: some View {
        VStack{
            Text("Login")
                .font(.title.bold()).padding()
            
            Form {
                HStack {
                    Text("Username")
                    TextField(text: $username, prompt: Text("Required")) { Text("Username") }
                }
                HStack {
                    Text("Password")
                    SecureField(text: $password, prompt: Text("Required")) { Text("Password") }
                }
            }.frame (height: 150)
            
            Button("Login") {
                print("Logging in")
                Task {
                    UpLiftTabViewModel.shared.user = try await NetworkManager.shared.getUser(username: username, password: password)
                }
            }.padding()
            
            HStack {
                Text("Don't have an account?")
                Button {
                    UpLiftTabViewModel.shared.signingUp = true
                    UpLiftTabViewModel.shared.loggingIn = false
                } label: {
                    Text("Sign Up!")
                }
            }
        }
        
    }
}

//func getUser(username: String, password: String, viewModel: UpLiftTabViewModel) async throws -> User {
//    guard let url = URL(string: "\(Constants.Urls.account)/\(username)/\(password)") else {
//        print("Invalid URL")
//        throw ULError.invalidURL
//    }
//    
//    let (data, _) = try await URLSession.shared.data(from: url)
//    
//    do {
//        let decoder = JSONDecoder()
//        let decodedUser = try decoder.decode(User.self, from: data)
//        print("Login for \(decodedUser.username) was successful!")
//        viewModel.loggingIn = false
//        return decodedUser
//    } catch {
//        print("decoding failed")
//        let failedUser = User()
//        failedUser.username = "Failed User"
//        return failedUser
//    }
//    
//}

#Preview {
    LoginView()
}
