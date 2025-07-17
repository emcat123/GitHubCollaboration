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
                .foregroundColor(.white) // White font
            
            HStack {
                TextField("Minutes", text: $inputMinutes)
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 100)
                    .foregroundColor(.white) // White text inside the field

                Button("Start") {
                    if let minutes = Int(inputMinutes), minutes > 0 {
                        timeRemaining = minutes * 60
                        isActive = true
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(.white) // Button color
                .foregroundColor(.blue) // Text color on button
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Fill the screen
        .background(Color(red: 0.0, green: 0.0, blue: 0.5)) // Navy background
        .ignoresSafeArea() // Extend behind notch
        .preferredColorScheme(.dark) // Makes system elements light on dark background
    }
    
    func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    CountdownTimer()
}
