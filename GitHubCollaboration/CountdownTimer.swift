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
    @State private var showAlert = false

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color(red: 188/255, green: 216/255, blue: 236/255)
                .ignoresSafeArea() // pastel blue background
            
            VStack(spacing: 20) {
                Text("Time Remaining: \(timeString(from: timeRemaining))")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                
                HStack {
                    TextField("Minutes", text: $inputMinutes)
                        .foregroundColor(.black)
                        .keyboardType(.numberPad)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 100)
                        
                            
                    
                    Button("Start") {
                        if let minutes = Int(inputMinutes), minutes > 0 {
                            timeRemaining = minutes * 60
                            isActive = true
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }
                    }
                    .disabled(isActive)
                    .padding(.horizontal)
                    .padding(.vertical, 6)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(8)
                    
                    Button("Reset") {
                        isActive = false
                        timeRemaining = 0
                        inputMinutes = ""
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 6)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(8)
                }
            }
            .padding()
            .onReceive(timer) { _ in
                guard isActive else { return }
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
                    isActive = false
                    showAlert = true
                }
            }
            .alert("Time's up!", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
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
    CountdownTimer()
}

