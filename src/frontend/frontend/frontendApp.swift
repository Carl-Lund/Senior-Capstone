//
//  frontendApp.swift
//  frontend
//
//  Created by Carl Lund on 3/14/24.
//

import SwiftUI

@main
struct frontendApp: App {

    var body: some Scene {
        WindowGroup {
            let _ = UserDefaults.standard.set(false, forKey: "_UiConstraintBasedLayoutLogUnsatisfiable")
            UpLiftTabView()
        }
    }
}
