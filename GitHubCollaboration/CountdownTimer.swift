//
//  CountdownTimer.swift
//  GitHubCollaboration
//
//  Created by Ruth Mehreteab on 7/15/25.
//

import SwiftUI

struct CountdownTimer: View {
    @State private var timeRemaining = 0
    @State private var isActive = false
    @State private var inputMinutes = ""
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Time Remaining: \(timeString(from: timeRemaining))")
                .font(.largeTitle)
            
            HStack {
                TextField("Minutes", text: $inputMinutes)
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 100)
                
                Button("Start") {
                    if let minutes = Int(inputMinutes), minutes > 0 {
                        timeRemaining = minutes * 60
                        isActive = true
                    }
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
        .onReceive(timer) { _ in
            guard isActive else { return }
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                isActive = false
                // Add your action when the timer reaches zero
            }
        }
    }
    
    func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}


#Preview {
    SwiftUIView()
}
