//
//  ObservableAndPublishedView.swift
//  TestingPropertyWrappers
//
//  Created by Alberto Jesus Tepale Diagas on 21/03/25.
//

import SwiftUI

class CounterModel: ObservableObject {
    @Published var count: Int = 0 // When this changes, UI updates
}

struct ObservableAndPublishedView: View {
    @ObservedObject var model = CounterModel() // observe the model
    
    var body: some View {
        VStack {
            Text("Count: \(model.count)")
            
            Button("Increment") {
                model.count += 1 // Updated UI via '@Published'
            }
            .padding(10)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

#Preview {
    ObservableAndPublishedView()
}
