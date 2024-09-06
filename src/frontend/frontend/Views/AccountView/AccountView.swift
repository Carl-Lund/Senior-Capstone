//
//  AccountView.swift
//  frontend
//
//  Created by Carl Lund on 3/27/24.
//

import SwiftUI
import PhotosUI

struct AccountView: View {
    
    let columns: [GridItem] = [GridItem(),
                               GridItem()]
    @State var photosPickerItem: PhotosPickerItem?
    
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .fill(Color("mainColor"))
                    .frame(height: 215)
                    .ignoresSafeArea()
                Spacer()
            }
            
            VStack {
                VStack (spacing: 0){
                    Text(UpLiftTabViewModel.shared.user.username)
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .shadow(radius: 10)
                        .bold()
                        .padding(.top, 20)
                    PhotosPicker(selection: $photosPickerItem, matching: .images) {
                        CircleImage(width: 150, borderIsShow: true, image: UpLiftTabViewModel.shared.user.profImage)
                    }
                    ScrollView {
                        Form {
                            Text ("Bio: \(UpLiftTabViewModel.shared.user.bio)")
                            Text ("Followers: 150")
                            Text ("Following: 100")
                            Text ("PR Boast: 460lb Max Squat")
                            Text ("Goal: Bench 315lb")
                        }
                        .scrollContentBackground(.hidden)
                        .frame(height: 340)
                        
                        VStack {
                            HStack {
                                Button {
                                } label: {
                                    Text("Workouts")
                                        .underline()
                                        .foregroundStyle(.white)
                                        .padding(3)
                                        .background(Color("mainColor"))
                                }
                                Button {
                                } label: {
                                    Text("Recipes")
                                        .foregroundStyle(Color("mainColor"))
                                        .padding(3)
                                }
                            }
                            .font(.title)
                            .bold()
                            .offset(x: -6)
                            
                            LazyVGrid (columns: columns, spacing: 0) {
                                GridCellView(post: MockData.samplePost)
                                GridCellView(post: MockData.samplePost1)
                                GridCellView(post: MockData.sampleRecipe)
                                GridCellView(post: MockData.samplePost2)
                                GridCellView(post: MockData.samplePost3)
                            }
                        }
                    }
                }
                .onChange(of: photosPickerItem) {
                    Task {
                        if let photosPickerItem,
                           let data = try? await photosPickerItem.loadTransferable(type: Data.self) {
                            if let image = UIImage(data: data) {
                                UpLiftTabViewModel.shared.user.profImage = image
                                if let jpegData = image.jpegData(compressionQuality: 0.8) {
                                    try await NetworkManager.shared.saveUserImage(imageModel: ImageModel(data: jpegData), id: UpLiftTabViewModel.shared.user.user_id)
                                    UpLiftTabViewModel.shared.user.userImage = jpegData
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AccountView()
}
