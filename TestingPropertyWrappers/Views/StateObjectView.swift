//
//  StateObjectView.swift
//  TestingPropertyWrappers
//
//  Created by Alberto Jesus Tepale Diagas on 22/03/25.
//

import SwiftUI

class TimerModel: ObservableObject {
    @Published var time = 0
    private var timer: Timer?

    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.time += 1
        }
    }
}


struct StateObjectView: View {
    @StateObject var timerModel = TimerModel()
    
    var body: some View {
        VStack {
            Text("Time: \(timerModel.time)")
            Button("Start Timer") {
                timerModel.start()
            }
            .padding(10)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

#Preview {
    StateObjectView()
}
