//
//  AccountView.swift
//  swiftui
//
//  Created by Carl Lund on 2/21/24.
//

import SwiftUI

struct AccountView: View {
    @StateObject private var vm: AccountViewModel
    
    // init is the constructor method
    init () {
        _vm = StateObject(wrappedValue: AccountViewModel(service: Webservice()))
    }
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                ForEach(vm.components, id: \.uniqueId) {component in component.render()}
                    .navigationTitle("Nav Title")
            }.task{
                await vm.load()
            }
        }
    }
}

#Preview {
    AccountView()
}
