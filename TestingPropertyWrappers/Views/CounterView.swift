//
//  CounterView.swift
//  TestingPropertyWrappers
//
//  Created by Alberto Jesus Tepale Diagas on 21/03/25.
//

import SwiftUI

struct CounterView: View {
    // @State Property Wrapper
    // @State manages the storage of this property in SwiftUI.
    // When 'count' changes, the view automatically re-renders.

    @State private var count = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Count: \(count)")
                .font(.largeTitle)
            
            HStack {
                Button("Increment") {
                    count += 1
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button("Reset") {
                    count = 0
                }
                .padding()
                .background(Color.teal)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button("Decrement") {
                    count -= 1
                }
                .padding()
                .background(Color.indigo)
                .foregroundColor(.white)
                .cornerRadius(10)
            }

            
        }
    }
}

#Preview {
    CounterView()
}
