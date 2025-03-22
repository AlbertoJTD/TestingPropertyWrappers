//
//  EnvironmentObjectView.swift
//  TestingPropertyWrappers
//
//  Created by Alberto Jesus Tepale Diagas on 21/03/25.
//

import SwiftUI

class UserSettings: ObservableObject {
    @Published var isDarkMode = false
}

struct SettingsView: View {
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        Toggle("Dark mode", isOn: $settings.isDarkMode)
    }
}

struct EnvironmentObjectView: View {
    var body: some View {
        SettingsView()
            .environmentObject(UserSettings())
            .padding()
    }
}

#Preview {
    EnvironmentObjectView()
}
