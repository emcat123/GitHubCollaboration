//
//  CalendarSwiftUIView.swift
//  GitHubCollaboration
//
//  Created by Scholar on 7/16/25.
//

import SwiftUI

struct Event: Identifiable {
    let id = UUID()
    let date: Date
    let title: String
}

struct CalendarSwiftUIView: View {
    @State private var selectedDate = Date()
    @State private var showAddEventSheet = false
    @State private var events: [Event] = []

    private var eventsForSelectedDate: [Event] {
        events.filter { Calendar.current.isDate($0.date, inSameDayAs: selectedDate) }
    }

    var body: some View {
        ZStack {
            // Pastel lavender background
            Color(red: 215/255, green: 192/255, blue: 255/255)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                DatePicker("Select your date", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .labelsHidden()
                    .padding()
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(15)
                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
                    .frame(maxWidth: 350)
                    .frame(maxWidth: .infinity, alignment: .center)

                Button("Add Event") {
                    showAddEventSheet = true
                }
                .padding()
                .background(Color.purple.opacity(0.7))
                .foregroundColor(.white)
                .cornerRadius(10)
                .frame(maxWidth: .infinity, alignment: .center)

                Text("Events on \(selectedDate.formatted(date: .long, time: .omitted))")
                    .font(.headline)
                    .foregroundColor(Color(red: 80/255, green: 60/255, blue: 140/255))

                if eventsForSelectedDate.isEmpty {
                    Text("No events for this date.")
                        .foregroundColor(.gray)
                } else {
                    List {
                        ForEach(eventsForSelectedDate) { event in
                            Text(event.title)
                                .listRowBackground(
                                    Color(red: 230/255, green: 220/255, blue: 255/255).opacity(0.6)
                                )
                        }
                        .onDelete(perform: deleteEvent)
                    }
                    .frame(maxHeight: 200)
                    .cornerRadius(15)
                }

                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .sheet(isPresented: $showAddEventSheet) {
            AddEventView(selectedDate: selectedDate) { title in
                let newEvent = Event(date: selectedDate, title: title)
                events.append(newEvent)
                showAddEventSheet = false
            }
        }
    }

    func deleteEvent(at offsets: IndexSet) {
        for index in offsets {
            let eventToDelete = eventsForSelectedDate[index]
            if let originalIndex = events.firstIndex(where: { $0.id == eventToDelete.id }) {
                events.remove(at: originalIndex)
            }
        }
    }
}

struct AddEventView: View {
    let selectedDate: Date
    @State private var eventTitle: String = ""
    var onSave: (String) -> Void
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Add Event for \(selectedDate.formatted(date: .long, time: .omitted))")
                    .font(.headline)
                    .padding()

                TextField("Event title", text: $eventTitle)
                    .textFieldStyle(.roundedBorder)
                    .padding()

                Button("Save") {
                    if !eventTitle.isEmpty {
                        onSave(eventTitle)
                    }
                }
                .disabled(eventTitle.isEmpty)
                .padding()
                .background(eventTitle.isEmpty ? Color.gray : Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)

                Spacer()
            }
            .padding()
            .background(
                Color(red: 230/255, green: 220/255, blue: 255/255) // lighter lavender
                    .ignoresSafeArea()
            )
            .navigationTitle("New Event")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    CalendarSwiftUIView()
}
