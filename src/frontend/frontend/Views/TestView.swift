//
//  TestView.swift
//  frontend
//
//  Created by Carl Lund on 4/19/24.
//

import SwiftUI

struct TestView: View {
    @State var field = ""
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack {
                        Text("Recipe Title:")
                            .bold()
                        TextField("", text: $field, prompt: Text("Required"))
                    }
                    HStack {
                        Text("Time Requirement:")
                            .bold()
                        TextField("", text: $field, prompt: Text("Required"))
                    }
                }
                
                Section {
                    HStack {
                        Text("Ingredients:")
                            .bold()
                        TextField("", text: $field, prompt: Text("Required"))
                    }
                    Image(systemName: "plus")
                        .foregroundColor(.blue)
                }
                
                Section {
                    HStack {
                        Text("Directions:")
                            .bold()
                        TextField("", text: $field, prompt: Text("Required"))
                    }
                    Image(systemName: "plus")
                        .foregroundColor(.blue)
                }
                
                Section {
                    Image(systemName: "photo")
                        .foregroundColor(.blue)
                }
                
                
            }
            .navigationTitle("Create Recipe")
            
            Button {
                
            } label: {
                Text("Submit")
            }
        }
    }
}

#Preview {
    TestView()
}
