//
//  UpLiftTabViewModel.swift
//  frontend
//
//  Created by Carl Lund on 4/12/24.
//

import Foundation

@Observable final class UpLiftTabViewModel {
    
    static let shared = UpLiftTabViewModel()
    
    var loggingIn = true
    var signingUp = false
    var user = User()
    var feed = [Post()]
}


