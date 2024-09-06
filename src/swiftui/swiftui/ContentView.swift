//
//  ContentView.swift
//  swiftui
//
//  Created by Carl Lund on 11/3/23.
//

import SwiftUI

struct ContentView: View {
//    @StateObject private var vm: LoginViewModel
//    
//    // init is the constructor method
//    init () {
//        _vm = StateObject(wrappedValue: LoginViewModel(service: Webservice()))
//    }

    var body: some View {
        LoginView()
//        NavigationView {
//            ScrollView {
//                ForEach(vm.components, id: \.uniqueId) {component in component.render()}
//                .navigationTitle("Nav Title")
//            }.task{
//                await vm.load()
//            }
//        }
    }
}

#Preview {
    ContentView()
}
