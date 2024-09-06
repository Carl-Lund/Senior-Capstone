//
//  SignUpView.swift
//  frontend
//
//  Created by Carl Lund on 4/29/24.
//

import SwiftUI

@MainActor struct SignUpView: View {
    
    @State private var user: User = User()
    
    var body: some View {
        VStack{
            Text("Sign Up")
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
                HStack {
                    Text("Bio")
                    TextField(text: $user.bio, prompt: Text("Required")) { Text("Bio") }
                }
            }.frame (height: 200)
            
            Button("Sign Up") {
                print("Logging in")
                Task {
                    try await NetworkManager.shared.createUser(user: user)
                    UpLiftTabViewModel.shared.signingUp = false
                    UpLiftTabViewModel.shared.loggingIn = true
                }
            }.padding()
            
            HStack {
                Text("Already have an account?")
                Button {
                    UpLiftTabViewModel.shared.signingUp = false
                    UpLiftTabViewModel.shared.loggingIn = true
                } label: {
                    Text("Login!")
                }
            }
        }
        
    }
}

#Preview {
    SignUpView()
}
