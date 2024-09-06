//
//  SearchView.swift
//  frontend
//
//  Created by Carl Lund on 4/24/24.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    @State var searchResults: [User] = [] // [User(username: "CarlLund", password: "Test", bio: "Test")]
    @State var buttonTitle: String = "Follow"
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { user in
                    UserListView(user: user)
                }
                .onChange(of: searchText) { 
                    Task {
                        searchResults = try await NetworkManager.shared.getUsersViaUsername(username: searchText)
                    }
                }
            }
            .navigationTitle("User Search")
        }
        .searchable(text: $searchText, prompt: "Username")
    }
}

struct UserListView: View {
    var user: User
    
    var body: some View {
        HStack {
            CircleImage(width: 40, borderIsShow: false)
            Text(user.username)
            Spacer()
            if UpLiftTabViewModel.shared.user.isFollowing(username: user.username) {
                Button("Following") {
                    
                    UpLiftTabViewModel.shared.user.following.removeAll(where: { $0 == user.username } )
                    
                    Task {
                        try await NetworkManager.shared.deleteFollowing(username: UpLiftTabViewModel.shared.user.username, following_username: user.username)
                    }
//                    Task {
//                        try await UpLiftTabViewModel.shared.user.following = NetworkManager.shared.getFollowing(user_id: user.user_id)
//                    }
                }
            } else {
                Button ("Follow") {
                    
                    UpLiftTabViewModel.shared.user.following.append(user.username)
                    
                    Task {
                        try await NetworkManager.shared.addFollowing(username: UpLiftTabViewModel.shared.user.username, following_username: user.username)
                    }
//                    Task {
//                        try await UpLiftTabViewModel.shared.user.following = NetworkManager.shared.getFollowing(user_id: user.user_id)
//                    }
                }
            }
        }
    }
}



#Preview {
    SearchView()
}
