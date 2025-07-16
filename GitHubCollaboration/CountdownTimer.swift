//
//  CountdownTimer.swift
//  GitHubCollaboration
//
//  Created by Ruth Mehreteab on 7/15/25.
//

import SwiftUI

struct CountdownTimer: View {
    @State private var timeRemaining = 100
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack{
            Text("Time Remaining: \(timeRemaining)")
        }
        .onReceive(timer){ _ in
            if timeRemaining > 0{
                timeRemaining -= 1
            }
            else{
                timer.upstream.connect().cancel()
            }
            
        }
    }
}

#Preview {
    CountdownTimer()
}
