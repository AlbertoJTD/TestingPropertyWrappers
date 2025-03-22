//
//  BindingView.swift
//  TestingPropertyWrappers
//
//  Created by Alberto Jesus Tepale Diagas on 22/03/25.
//

import SwiftUI

struct CustomToggle: View {
    @Binding var isOn: Bool
    
    var body: some View {
        Button(action: { isOn.toggle() }) {
            Circle()
                .fill(isOn ? Color.green : Color.red)
                .frame(width: 80)
        }
    }
}

struct BindingView: View {
    @State private var isOn = false
    
    var body: some View {
        VStack {
            Text("Switch is \(isOn ? "ON" : "OFF")")
            CustomToggle(isOn: $isOn)
        }
    }
}

#Preview {
    BindingView()
}
