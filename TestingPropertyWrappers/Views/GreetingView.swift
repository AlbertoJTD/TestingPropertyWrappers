//
//  GreetingView.swift
//  TestingPropertyWrappers
//
//  Created by Alberto Jesus Tepale Diagas on 21/03/25.
//

import SwiftUI

struct Theme: Equatable {
    var color: Color
    var fontSize: CGFloat
}

struct GreetingView: View {
    @State private var name: String = ""
    @State private var isBold: Bool = false
//    @State private var fontSize: CGFloat = 20
//    @State private var textColor: Color = .blue
    @State private var theme = Theme(color: .blue, fontSize: 20)
    
    var body: some View {
        VStack(spacing: 20) {
            // Text field to input name
            TextField("Enter your name", text: $name)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
            
            // Toggle to switch text style
            Toggle("Bold text", isOn: $isBold)
                .padding(.horizontal)
            Button("Clear name") {
                name = ""
            }
            .padding()
            .background(Color.indigo)
            .cornerRadius(8)
            .foregroundColor(.white)
            
            // Slider to adjust font size
            VStack {
                Text("Font size: \(Int(theme.fontSize))")
                    .font(.subheadline)
                Slider(
                    value: Binding(
                        get: { theme.fontSize },
                        set: { newValue in
                            theme = Theme(color: theme.color, fontSize: newValue)
                    }
                    ),
                   in: 10...100,
                   step: 1
                )
            }
            .padding(.horizontal)
            
            Stepper {
                Text("Font size is \(Int(theme.fontSize)) points big")
            } onIncrement: {
                theme = Theme(color: theme.color, fontSize: theme.fontSize + 1)
            } onDecrement: {
                theme = Theme(color: theme.color, fontSize: theme.fontSize - 1)
            }
            .padding()
            
            // Color picker
            ColorPicker(
                "Text color",
                selection: Binding(
                    get: { theme.color },
                    set: { newColor in
                        theme = Theme(color: newColor, fontSize: theme.fontSize)
                    }
                )
            )
            .padding(.horizontal)
            
            // Dynamic greeting text
            Text("Hello, \(name.isEmpty ? "Stranger" : name)")
                .font(.system(size: theme.fontSize))
                .bold(isBold)
                .foregroundStyle(theme.color)
                .opacity(name.isEmpty ? 0.5 : 1)

        }
        .padding()
    }
}

#Preview {
    GreetingView()
}
