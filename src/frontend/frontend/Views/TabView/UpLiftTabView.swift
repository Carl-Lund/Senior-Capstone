//
//  TabView.swift
//  frontend
//
//  Created by Carl Lund on 4/11/24.
//

import SwiftUI

struct UpLiftTabView: View {

    var body: some View {
        ZStack {
            if !UpLiftTabViewModel.shared.loggingIn && !UpLiftTabViewModel.shared.signingUp {
                TabView {
                    VStack (spacing: 0) {
                        Text("UpLift")
                            .foregroundStyle(.white)
                            .font(.system(size: 40, weight: .bold, design: .default))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("mainColor").edgesIgnoringSafeArea([]))
                        FeedView()
                    }
                    .tabItem {
                        VStack {
                            Image(systemName: "house.circle.fill") 
                            Text("Feed")
                        }
                    }
                    SearchView()
                        .tabItem {
                            Image(systemName: "magnifyingglass.circle.fill")
                            Text("Search")
                        }
                    CreatorView()
                        .tabItem {
                            VStack {
                                Image(systemName: "plus.square")
                                Text("Create")
                            }
                        }
                    AccountView()
                        .tabItem {
                            VStack {
                                Image(systemName: "person.circle")
                                Text("Account")
                            }
                        }
                }
                
            }
            
            if UpLiftTabViewModel.shared.loggingIn {
                LoginView()
            }
            
            if UpLiftTabViewModel.shared.signingUp {
                SignUpView()
            }
            
        }
    }
}

#Preview {
    UpLiftTabView()
}
