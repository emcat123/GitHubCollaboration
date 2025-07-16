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
        
        VStack {
            DatePicker("Select your birthday", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .labelsHidden()
            
            Text("You selected: \(selectedDate.formatted(date: .long, time: .omitted))")
                .font(.headline)
                .padding()
        }.padding()
    }
}

#Preview {
    CalendarSwiftUIView()
}
