//
//  CircleImage.swift
//  frontend
//
//  Created by Carl Lund on 3/28/24.
//

import SwiftUI
import PhotosUI

struct CircleImage: View {
    var width: CGFloat
    var borderIsShow: Bool
    var image: UIImage?
    
    var body: some View {
        
        if borderIsShow {
            Image(uiImage: image ?? UIImage(resource: .defaultAvatar))
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: width)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 10)
        } else {
            Image(uiImage: image ?? UIImage(resource: .defaultAvatar))
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: width)
                .clipShape(Circle())
        }
    }
}

#Preview {
    CircleImage(width: 150, borderIsShow: true)
}
