//
//  Webservice.swift
//  swiftui
//
//  Created by Carl Lund on 11/3/23.
//

import Foundation

enum Networkerror: Error {
    case invalidURL
    case invalidServerResponse
}

class Webservice {

    func load(resource: String) async throws -> ScreenModel {
        guard let url = URL (string: resource) else {
            throw Networkerror.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
                    throw Networkerror.invalidServerResponse
              }
        return try JSONDecoder().decode(ScreenModel.self, from: data)
    }
}
