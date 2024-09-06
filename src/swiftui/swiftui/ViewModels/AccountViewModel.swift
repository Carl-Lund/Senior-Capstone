//
//  LoginViewModel.swift
//  swiftui
//
//  Created by Carl Lund on 11/3/23.
//

import Foundation

// Make sure our components and properties are assigned on the main thread.
@MainActor
// Code that handles all the requests and maps the JSON to its respective model and then layout components
class AccountViewModel: ObservableObject {
    private var service: Webservice
    @Published var components: [UIComponent] = []
    
    init(service: Webservice) {
        self.service = service
    }
    
    func load() async {
        do {
            let screenModel = try await service.load(resource: Constants.Urls.account)
            components = try screenModel.buildComponents()
        } catch {
            print(error)
        }
        
    }
}
