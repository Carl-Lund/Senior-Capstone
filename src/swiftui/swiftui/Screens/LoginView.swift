//
//  LoginView.swift
//  swiftui
//
//  Created by Carl Lund on 2/20/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var user = User()
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    var body: some View {
        
        VStack{
            Text("Login")
                .font(.title.bold()).padding()
            
            Form {
                HStack {
                    Text("Username")
                    TextField(text: $user.username, prompt: Text("Required")) { Text("Username") }
                }
                HStack {
                    Text("Password")
                    SecureField(text: $user.password, prompt: Text("Required")) { Text("Password") }
                }
            }.frame(height: 150)
            
            Button("Login") {
                print("Login button clicked!")
                Task {
                    await loginUser()
                }
            }.padding()
            
            Text("Don't have an account? Sign Up")
        }
        .alert("Logged in!", isPresented: $showingConfirmation) { 
            Button("OK") { }
        } message: {
            Text(confirmationMessage)
        }
    }
    
    func loginUser() async {
        let url = URL(string: "\(Constants.Urls.account)/\(user.username)/\(user.password)")!

        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Requsest error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
               guard let data = data else { return }
               DispatchQueue.main.async {
                   do {
                       let decodedUser = try JSONDecoder().decode(User.self, from: data)
                       confirmationMessage = "User: \(decodedUser.username) is logged in with the password: \(decodedUser.password)"
                       showingConfirmation = true
                   } catch let error {
                       print("Error decoding: ", error)
                   }
               }
            }
        }

        dataTask.resume()
    }
}


#Preview {
    LoginView()
}
