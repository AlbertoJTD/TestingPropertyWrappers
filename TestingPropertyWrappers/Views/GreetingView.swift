//
//  GreetingView.swift
//  TestingPropertyWrappers
//
//  Created by Alberto Jesus Tepale Diagas on 21/03/25.
//

import SwiftUI

struct GreetingView: View {
    @State private var name: String = ""
    @State private var isBold: Bool = false
    @State private var fontSize: CGFloat = 20
    @State private var textColor: Color = .blue
    
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
                Text("Font size: \(Int(fontSize))")
                    .font(.subheadline)
                Slider(value: $fontSize, in: 10...100, step: 1)
            }
            .padding(.horizontal)
            
            // Color picker
            ColorPicker("Text color", selection: $textColor)
                .padding(.horizontal)
            
            // Dynamic greeting text
            Text("Hello, \(name.isEmpty ? "Stranger" : name)")
                .font(.system(size: fontSize))
                .bold(isBold)
                .foregroundStyle(textColor)
                .opacity(name.isEmpty ? 0.5 : 1)

        }
        .padding()
    }
}

#Preview {
    GreetingView()
}
