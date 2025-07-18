//
//  CalendarSwiftUIView.swift
//  GitHubCollaboration
//
//  Created by Scholar on 7/16/25.
//

import SwiftUI

struct CalendarSwiftUIView: View {
    @State private var selectedDate = Date()
    
    var body: some View {
        ZStack {
            // Pastel lavender background
            Color(red: 215/255, green: 192/255, blue: 255/255)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                DatePicker("Select your birthday", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .labelsHidden()
                    .padding()
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(15)
                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
                
                Text("You selected: \(selectedDate.formatted(date: .long, time: .omitted))")
                    .font(.headline)
                    .foregroundColor(Color(red: 80/255, green: 60/255, blue: 140/255)) // darker lavender-ish text
                    .padding()
            }
            .padding()
        }
    }
}

#Preview {
    CalendarSwiftUIView()
}
