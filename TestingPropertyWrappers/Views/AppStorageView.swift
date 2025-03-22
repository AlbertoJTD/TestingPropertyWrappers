//
//  AppStorageView.swift
//  TestingPropertyWrappers
//
//  Created by Alberto Jesus Tepale Diagas on 22/03/25.
//

import SwiftUI

struct AppStorageView: View {
    // Store small amounts of data
    @AppStorage("username") var username = "Guest"
    
    var body: some View {
        HStack {
            TextField("Enter your name", text: $username)
                .padding()
                .background(Color.gray.opacity(0.15))
                .cornerRadius(8)
        }
        .padding()
    }
}

#Preview {
    AppStorageView()
}
