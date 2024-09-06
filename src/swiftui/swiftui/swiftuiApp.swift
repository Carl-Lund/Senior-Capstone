//
//  swiftuiApp.swift
//  swiftui
//
//  Created by Carl Lund on 11/3/23.
//

import SwiftUI

@main
struct swiftuiApp: App {
    var body: some Scene {
        WindowGroup {
            let _ = UserDefaults.standard.set(false, forKey: "_UiConstraintBasedLayoutLogUnsatisfiable")
            ContentView()
        }
    }
}
