//
//  GridCellView.swift
//  frontend
//
//  Created by Carl Lund on 4/22/24.
//

import SwiftUI

struct GridCellView: View {
    
    var post: PostTest
    
    var body: some View {
        VStack {
            Text(post.title)
                .font(.title2)
                .bold()
                .padding(5)
                .scaledToFit()
                .minimumScaleFactor(0.5)
                .foregroundColor(.white)
            Spacer()
            AsyncImage(url: URL(string: post.imageUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipped()
            } placeholder: {
                Image(systemName: "photo")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 350)
            }
        }
        .background(Color("mainColor"))
    }
}

#Preview {
    GridCellView(post: MockData.samplePost)
}
