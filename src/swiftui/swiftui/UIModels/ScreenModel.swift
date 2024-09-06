//
//  ScreenModel.swift
//  swiftui
//
//  Created by Carl Lund on 11/3/23.
//

import Foundation

enum ComponentError: Error {
    case decodingError
}

enum ComponentType: String, Decodable {
    case titleImg
}

struct ComponentModel: Decodable {
    let type: ComponentType
    let data: [String: String]
}

struct ScreenModel: Decodable {
    let pageTitle: String
    let components: [ComponentModel]
}

// Constructs the UI components and returns it
extension ScreenModel {
    func buildComponents() throws -> [UIComponent] {
        
        var components: [UIComponent] = []
        
        for component in self.components {
            switch component.type {
                case .titleImg:
                    guard let uiModel: AccountUIModel = component.data.decode() else { throw ComponentError.decodingError}
                    components.append(AccountComponent(uiModel: uiModel))
            }
        }
        
        return components
    }
}
