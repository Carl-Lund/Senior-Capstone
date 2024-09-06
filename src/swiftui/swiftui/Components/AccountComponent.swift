//
//  TitleImageComponent.swift
//  swiftui
//
//  Created by Carl Lund on 11/3/23.
//

import Foundation
import SwiftUI

struct AccountComponent: UIComponent{
    
    let uiModel: AccountUIModel
    
    var uniqueId: String {
        return ComponentType.titleImg.rawValue
    }
    
    func render() -> AnyView {
        AsyncImage(url: uiModel.imageUrl) { image in
            image.resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
        } placeholder: {
            ProgressView()
        }.toAnyView()
    }
     
}
